#Data_source : https://fixer.io/usage with account obertran96@gmail.com and free account pass aze1234*
library(jsonlite)

#download forex rates of the day from fixer.io API
rates_json_r = fromJSON(paste("http://data.fixer.io/api/latest?access_key=fa66d9b887203951fb9f02619e4d6738&format=1"))
#copy .json file to local directory
write(toJSON(rates_json_r), paste0("scrapped/", "forex_", Sys.Date(), ".json"))

#copy .json data to a csv data.frame
file.names = dir("scrapped", pattern =".json")
n = length(file.names)
rates_df = data.frame(date=(1:n), USD=(1:n), GBP=(1:n))
for(i in 1:length(file.names)){
  rates_day = fromJSON(readLines(paste0("scrapped/", file.names[i]), warn = FALSE))
  rates_df$date[i] = rates_day$date
  rates_df$USD[i] = rates_day$rates$USD
  rates_df$GBP[i] = rates_day$rates$GBP}
#copy the dataframe containing rates to a .csv
write.csv(rates_df, "rates.csv")