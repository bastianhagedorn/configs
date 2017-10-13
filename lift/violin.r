#!/bin/R

library(ggplot2)
library(optparse)

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="dataset file name", metavar="character"),
	make_option(c("-o", "--out"), type="character", default="violin.pdf",
              help="output pdf file name [default= %default]", metavar="character"),
    make_option(c("-d", "--duration"), type="character", default="N/A",
              help="duration of the tuning [default= %default]", metavar="character"),
    make_option(c("-r", "--ref"), type="integer", default=1,
              help="default reference runtime in ns [default= %default]", metavar="integer"),
    make_option(c("-t", "--tuned"), type="integer", default=1,
              help="tuned reference runtime in ns [default= %default]", metavar="integer"),
    make_option(c("--tunedConfigs"), type="integer", default=-1,
              help="tuned configs used for ppcg-tuning [default= %default]", metavar="integer"),
    make_option(c("--requiredToFind"), type="integer", default=-1,
              help="configs ppcg-tuning required to find best [default= %default]", metavar="integer"),
    make_option(c("--liftKernels"), type="integer", default=-1,
              help="how many tuned lift kernels? [default= %default]", metavar="integer"),
    make_option(c("--liftConfigs"), type="integer", default=-1,
              help="how many configs used for lift? [default= %default]", metavar="integer"),
    make_option(c("--liftReproduced"), type="integer", default=-1,
              help="best reproduced tuning result? [default= %default]", metavar="integer"),
    make_option(c("--requiredLiftConfigs"), type="integer", default=-1,
              help="how configs required to find best? [default= %default]", metavar="integer")

);

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

data = read.csv(file=opt$file, header=TRUE, sep=";")
data$time <- 1/data$time

ppcgDefault=1/opt$ref
ppcgTuned=1/opt$tuned
liftRep=1/opt$liftReproduced
tunedLabel=sprintf("ppcg-tuned (%d/%d)", opt$tunedConfigs, opt$requiredToFind)
xLabel=sprintf("Lift: name=%s, tested configs=%d, number of kernels=%d\nDuration: %s", opt$out, opt$liftConfigs, opt$liftKernels, opt$duration)

plot <- ggplot(data, aes("", y=time)) +
		geom_violin() +
		geom_boxplot(width=0.05, outlier.color=NA) +
        geom_hline(yintercept = ppcgDefault) +
        geom_hline(yintercept = ppcgTuned) +
        geom_hline(yintercept = liftRep) +
        annotate(geom="text", label=tunedLabel, x=0.7, y=ppcgTuned, vjust=-.5) +
        annotate(geom="text", label="ppcg-default", x=0.7, y=ppcgDefault, vjust=-.5) +
        annotate(geom="text", label="lift-reproduced", x=0.7, y=liftRep, vjust=-.5) +
        theme_bw() +
        ylab("1 / runtime") +
        xlab(xLabel)
        #theme(
        #    axis.title.x=element_blank(),
        #    axis.ticks.x=element_blank())

ggsave(opt$out, plot)
