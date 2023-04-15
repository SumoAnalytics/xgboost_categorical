
library(tidymodels)
library(tidyverse)

mtcars_cat <- mtcars %>% 
  mutate(hp = paste0("cat_", hp)) %>% 
  as_tibble()


xgb_cat <- boost_tree(mode = "regression") %>% 
  set_engine("xgboost") %>% 
  fit(mpg ~ ., data = mtcars_cat)


vip::vip(xgb_cat)
