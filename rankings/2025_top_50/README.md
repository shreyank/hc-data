# Top 50 Rankings from 2025

### Data Files
- bgg_games_metadata_20250601.csv - extract from BGG of game meta for all games in Herd or HCHQ top 50 lists. Data as of 2025-06-01.
- hchq_rankings_deidentified.csv - HCHQ top 50 lists deidentified.
- herd_rankings_deidentified.csv - Herd top 50 lists deidentified.


### R Files for analysis
- initially written by Martin Fowler
- hc-2025.Rmd      - plot of totals and distributions of herd rankings
- hc-2025-18xx.Rmd - include 18xx as if it were a single game
- hc-2025-hchq.Rmd - compare herd rankings to HCHQ
- rakefile - ruby code to copy generated html to top level

These should knit with R. R generates HTML files in this folder, such files are ignored by git. The rakefile includes a script to copy these files to the top level HTML folder, which is retained by git. This way we keep HTML files separate for non-R users to read, and avoid populating git with intermediate HTML files while we are working on R scripts.
