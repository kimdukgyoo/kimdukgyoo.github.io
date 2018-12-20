#   _________________________
# < Author: Krzysztof Pytka  >
#   -------------------------
## modified and commented by Duk Gyoo Kim

## Tree (green part)
y<-runif(1e4)   # 10,000 randomly generated values from a uniform distribution [0,1]
y_gen<-ifelse(y<.66, 1.2*y, y)  # if less than 0.66, multiply by 1.2
y_gen<-ifelse(y<.33, 1.8*y, y_gen) # if less than 0.33, multiply by 1.8
x<- runif(1e4, -1/2, 1/2)*(1-y_gen) # 10,000 randomly generated values from a uniform distribution [-1/2, 1/2] multiplied by the generated y values. If multiply by y, it will make a scatterplot of a triangle.

## Ornament (Orange red circles)
N_bombs<-1.5e2  # 150 ornaments
y2<-sample(y, N_bombs) # 150 random samples from y
y_gen2<-ifelse(y2<.66, 1.2*y2, y2) # similar to the Tree part.
y_gen2<-ifelse(y2<.33, 1.8*y2, y_gen2) # similar to the Tree part.
z<- runif(N_bombs, -1/2, 1/2)*(1-y_gen2)

## Drawing
plot(runif(5e2, -0.1, 0.1), runif(5e2,-0.1,0), col='brown', pch="|",  ylim=c(-.1, 1.1), xlim=c(-.5,.5), main='Monte-Carlo Approximation of X-mas Tree', xlab='x-mas', ylab='y-mas') #Tree base (brown ones)
points(y~x, col='darkgreen',  pch=2)
points(y2~z, col='orangered2', cex=2, lwd=2)
points(0, 1.05, cex=3, col='orange', pch=11, lwd=3) # The star at the top
points(runif(2e2, -1/2, 1/2), runif(2e2,-0.1,1.2), col='blue', pch=8) # snow
grid()
