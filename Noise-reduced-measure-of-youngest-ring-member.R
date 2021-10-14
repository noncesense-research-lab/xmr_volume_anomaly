
# NOTE: Must first install data.table package if not already installed.
# Un-comment this line if data.table is not yet installed:
# install.packages("data.table")

library(data.table)

xmr.tx <- data.table::fread("ringmember_height_flood.csv")
height <- data.table::fread("block_stat_2021.csv")

colnames(height)[1] <- "source_height"
height[, timestamp.time := as.POSIXct(timestamp, origin="1970-01-01")]
height[, timestamp.date := as.Date(timestamp.time)]

xmr.tx <- merge(xmr.tx, height)


xmr.tx[, source_height := as.numeric(source_height)]
xmr.tx[, ringmember_height := as.numeric(ringmember_height)]
# convert to floating point numbers

xmr.tx[, input.age := source_height - ringmember_height ]

xmr.tx[, min.input.age := min(input.age), by = .(timestamp.time, timestamp.date, source_height, source_tx_index)]

xmr.tx[, mean.min.input.age.by.block := mean(min.input.age), by = .(timestamp.time, timestamp.date, source_height)]

xmr.tx.tx.level <- unique(xmr.tx[, .(source_height, 
  source_tx_index, source_tx_index, timestamp.date, min.input.age)])


as.data.frame(xmr.tx.tx.level[, sum(min.input.age == 10), by = .(timestamp.date)] )

mean.mean.min.age <- unique(xmr.tx[, .(timestamp.time, source_height, mean.min.input.age.by.block)])

mean.mean.min.age[, mean.min.input.age.by.block.100.moving.median := 
    c(rep(NA, 99), zoo::rollapply(mean.min.input.age.by.block, 100, median))]


write.csv(mean.mean.min.age, file = "Noise-reduced-measure-of-youngest-ring-member.csv", row.names = FALSE)


# png("2-vin-min-ringmember-age.png", height = 800, width = 1000)

plot(mean.mean.min.age[, .(timestamp.time, mean.min.input.age.by.block.100.moving.median)], type = "l")
abline(v = mean.mean.min.age$timestamp.time[mean.mean.min.age$source_height == 2409000], col = "red", lty = 2)

# Need ggplot2 package installed
# install.packages("ggplot2")

library(ggplot2)

# png("Noise-reduced-measure-of-youngest-ring-member-plot.png", width = 600, height = 600)

ggplot(mean.mean.min.age) + ylim(0, max(mean.mean.min.age$mean.min.input.age.by.block.100.moving.median)) +
  geom_line(aes(x = timestamp.time, y = mean.min.input.age.by.block.100.moving.median)) +
  geom_vline(xintercept = mean.mean.min.age$timestamp.time[mean.mean.min.age$source_height == 2409000], 
    color = "red", linetype = "dashed") +
  ggtitle("Noise-reduced measure of youngest ring member as a function of time")

# dev.off()


