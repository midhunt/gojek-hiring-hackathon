dtDriverDetails[, is_male := ifelse(gender == "MALE", 1, 0)]

str(dtDriverDetails)

dtDriversClusterData <- data.matrix(dtDriverDetails[,.(age,
                                                       number_of_kids,
                                                       is_male)])

totalWithinss <- vector()

for(i in 1:20) {
  kmeansClusters <- kmeans(dtDriversClusterData,
                           centers = i)
  
  totalWithinss[i] <- kmeansClusters$tot.withinss
  
}

dtTotalWithinss <- data.table(centers = 1:length(totalWithinss),
                              tot_withinss = totalWithinss)

ggplot(dtTotalWithinss) +
  geom_line(aes(x = centers, y = tot_withinss)) +
  xlab("Centers") +
  ylab("Total Withinss")


# Updating the number of centers based on elbow method 
kmeansClusters <- kmeans(dtDriversClusterData,
                         centers = 6)

dtDriverDetails[, clusterNo := kmeansClusters$cluster]

dtDayDuration[, driver_id := as.integer(as.character(driver_id))]

dtClusterData <- merge(dtDayDuration[,.(driver_id, is_weekend, duration_online_hrs)],
                dtDriverDetails[,.(driver_id, clusterNo)],
                by = "driver_id",
                all.x = T, all.y = F)

summary(lm.fit8)

lm.fit8 <- lm(duration_online_hrs ~ is_weekend + clusterNo,
              data = dtClusterData)

