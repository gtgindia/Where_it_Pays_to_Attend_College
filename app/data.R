library(data.table)

dt_degree <- fread("../data/degrees-that-pay-back.csv")
dt_sal_collage <- fread("../data/salaries-by-college-type.csv")
dt_sal_region <- fread("../data/salaries-by-region.csv")

colnames(dt_degree) <- c("Undergraduate_Major","Starting_Salary","MidCareer_Salary","Percent_change","mid_10_%tile",
                         "mid_25_%tile","mid_75_%tile","mid_90_%tile")

dt_degree$Starting_Salary <- parse_number(dt_degree$Starting_Salary)
dt_degree$MidCareer_Salary <- parse_number(dt_degree$MidCareer_Salary)