#extract rows with desire experiment using grep command

dat_IR = dat[grep("IR|Control", dat$conditions),]
