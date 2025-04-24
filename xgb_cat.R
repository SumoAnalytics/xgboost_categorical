
library(tidymodels)
library(tidyverse)

mtcars_cat <- mtcars %>% 
  mutate(hp = as.factor(paste0("cat_", hp))) %>% 
  as.data.frame()


xgb_cat <- boost_tree(mode = "regression") %>% 
  set_engine("xgboost") %>% 
  fit(mpg ~ ., data = mtcars_cat)


vip::vip(xgb_cat)


