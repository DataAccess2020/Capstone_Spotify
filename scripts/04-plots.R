# Boxplot on energy ----
data$country_sort <- with(data, reorder(country, energy, function(x) median(x, na.rm = T)))
box_energy <- ggplot(data, aes(country_sort, energy)) + 
  geom_boxplot() + 
  coord_flip() +
  labs(y = 'energy', x ='country', title = "Plot 1. Boxplot for 'energy' scores for three countries") +
  theme_cowplot()

# Creating the table for ggplot facet_wrap ----
means_first <- cbind(all_means_main[1:3, 1], all_means_main[1:3, 2], names(all_means_main[2]))
names(means_first)[1] <- 'country'
names(means_first)[2] <- 'mean'
names(means_first)[3] <- 'variable'

# To create the table, I need a column for country, a column for the mean and a column
# for the variable which represents this mean

for (i in 3:10) {
  means <- cbind(all_means_main[1:3, 1], all_means_main[1:3, i], names(all_means_main[i]))
  names(means)[1] <- 'country'
  names(means)[2] <- 'mean'
  names(means)[3] <- 'variable'
  means_first <- rbind(means_first, means)
}

# Plot facet_wrap ----
features_wrap <- ggplot(means_first, aes(country, mean, fill=variable)) +
  geom_col() + 
  facet_wrap(~variable, ncol = 3, scales='free') +
  labs(title = 'Plot 2. Differences in features across countries') +
  theme_cowplot() +
  guides(fill="none") +
  scale_fill_brewer(palette="Set3")