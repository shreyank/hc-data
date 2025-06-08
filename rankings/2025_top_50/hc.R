library(tidyverse)
herd_rankings <- read_csv("herd_rankings_deidentified.csv", col_types = list(bgg_id = col_character())) |>
  mutate(population="herd")

n_herd_voters <- herd_rankings |> 
  select(identifier) |> 
  distinct() |> 
  nrow()

games <- read_csv("bgg_games_metadata_20250601.csv", col_types = list(bgg_id = col_character())) 

# points are Borda counts <https://en.wikipedia.org/wiki/Borda_count>
# use borda_50 for total borda score and nb_50 for a borda_50 divided by number of voters (normalized borda 50)

herd_ranked_games <- herd_rankings |> 
  group_by(bgg_id) |> 
  summarize(
    borda_50 = sum(points), # total number of points
    nb_50 = borda_50 / n_herd_voters # points normalized by dividing by number of voters
    ) |> 
  arrange(desc(borda_50)) |> 
  mutate(herd_rank = min_rank(desc(borda_50)))

herd_top_50_games <- herd_ranked_games |> 
  filter(herd_rank <= 50) |> 
  left_join(games, by = 'bgg_id') 

herd_top50_rankings <- herd_rankings |> 
 inner_join(herd_top_50_games, by = 'bgg_id') |> 
  left_join(games, by="bgg_id") |> 
  arrange(herd_rank)

