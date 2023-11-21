'''
The test scores for all high school seniors in a certain state have a mean of 
60 and a variance of 64. A random sample of n = 100 students from a large high 
school had a mean score of 58. Is there evidence to suggest that the level of 
knowledge at this school is lower? (Calculate the probability that the mean of 
a random sample is at most 58 when n = 100.)
'''

(pnorm(58, mean=60, sd=8/10))