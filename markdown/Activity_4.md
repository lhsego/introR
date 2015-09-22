### Activity 4: Statistical and graphical analyses ###

#### Activity 4.1: A simple linear regression model ####

Let's now consider fitting a simple linear regression model
to some car data that compares stopping distance to speed
for 50 vehicles.

Because these data are available in base R, we don't have to
load the data or read it from a file.  We can simply access
it by typing `cars`.

Look at the structure of the cars data.


```r
str(cars)
```

```
'data.frame':	50 obs. of  2 variables:
 $ speed: num  4 4 7 7 8 9 10 10 10 11 ...
 $ dist : num  2 10 4 22 16 10 18 26 34 17 ...
```

Now that we know what the column names are, let's plot the
data.


```r
plot(cars[, "speed"], cars[, "dist"], xlab = "Speed", ylab = "Distance")
```

![plot of chunk unnamed-chunk-2](figures/knitr/unnamed-chunk-2-1.png) 

Now let's fit a simple linear regression model, and use
speed to predict the stopping distance.  We use the linear
model function, `lm()`.


```r
slrModel <- lm(dist ~ speed, data = cars)
```


If we call `str()` on `slrModel`, we see that it is a
complicated R object called a list.


```r
str(slrModel)
```

```
List of 12
 $ coefficients : Named num [1:2] -17.58 3.93
  ..- attr(*, "names")= chr [1:2] "(Intercept)" "speed"
 $ residuals    : Named num [1:50] 3.85 11.85 -5.95 12.05 2.12 ...
  ..- attr(*, "names")= chr [1:50] "1" "2" "3" "4" ...
 $ effects      : Named num [1:50] -303.914 145.552 -8.115 9.885 0.194 ...
  ..- attr(*, "names")= chr [1:50] "(Intercept)" "speed" "" "" ...
 $ rank         : int 2
 $ fitted.values: Named num [1:50] -1.85 -1.85 9.95 9.95 13.88 ...
  ..- attr(*, "names")= chr [1:50] "1" "2" "3" "4" ...
 $ assign       : int [1:2] 0 1
 $ qr           :List of 5
  ..$ qr   : num [1:50, 1:2] -7.071 0.141 0.141 0.141 0.141 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:50] "1" "2" "3" "4" ...
  .. .. ..$ : chr [1:2] "(Intercept)" "speed"
  .. ..- attr(*, "assign")= int [1:2] 0 1
  ..$ qraux: num [1:2] 1.14 1.27
  ..$ pivot: int [1:2] 1 2
  ..$ tol  : num 1e-07
  ..$ rank : int 2
  ..- attr(*, "class")= chr "qr"
 $ df.residual  : int 48
 $ xlevels      : Named list()
 $ call         : language lm(formula = dist ~ speed, data = cars)
 $ terms        :Classes 'terms', 'formula' length 3 dist ~ speed
  .. ..- attr(*, "variables")= language list(dist, speed)
  .. ..- attr(*, "factors")= int [1:2, 1] 0 1
  .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. ..$ : chr [1:2] "dist" "speed"
  .. .. .. ..$ : chr "speed"
  .. ..- attr(*, "term.labels")= chr "speed"
  .. ..- attr(*, "order")= int 1
  .. ..- attr(*, "intercept")= int 1
  .. ..- attr(*, "response")= int 1
  .. ..- attr(*, ".Environment")=<environment: 0x7fe1f5d66638> 
  .. ..- attr(*, "predvars")= language list(dist, speed)
  .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
  .. .. ..- attr(*, "names")= chr [1:2] "dist" "speed"
 $ model        :'data.frame':	50 obs. of  2 variables:
  ..$ dist : num [1:50] 2 10 4 22 16 10 18 26 34 17 ...
  ..$ speed: num [1:50] 4 4 7 7 8 9 10 10 10 11 ...
  ..- attr(*, "terms")=Classes 'terms', 'formula' length 3 dist ~ speed
  .. .. ..- attr(*, "variables")= language list(dist, speed)
  .. .. ..- attr(*, "factors")= int [1:2, 1] 0 1
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:2] "dist" "speed"
  .. .. .. .. ..$ : chr "speed"
  .. .. ..- attr(*, "term.labels")= chr "speed"
  .. .. ..- attr(*, "order")= int 1
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: 0x7fe1f5d66638> 
  .. .. ..- attr(*, "predvars")= language list(dist, speed)
  .. .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
  .. .. .. ..- attr(*, "names")= chr [1:2] "dist" "speed"
 - attr(*, "class")= chr "lm"
```

Fortunately, there are a variety of method functions we
can use to extract information from the `slrModel` object.
For example, the `summary()` function gives the slope, 
intercept, R-squared, and other statistics.


```r
summary(slrModel)
```

```

Call:
lm(formula = dist ~ speed, data = cars)

Residuals:
    Min      1Q  Median      3Q     Max 
-29.069  -9.525  -2.272   9.215  43.201 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -17.5791     6.7584  -2.601   0.0123 *  
speed         3.9324     0.4155   9.464 1.49e-12 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 15.38 on 48 degrees of freedom
Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
```

We can also extract the coefficients of the model.


```r
coef(slrModel)
```

```
(Intercept)       speed 
 -17.579095    3.932409 
```

And we can superimpose the regression line on the plot.
(Remake the plot of these data first before executing the
`abline()` command if you closed the plot.)
![plot of chunk unnamed-chunk-7](figures/knitr/unnamed-chunk-7-1.png) 

```r
abline(slrModel, col = "Blue")
```

You can close the current plot using:


```r
dev.off()
```

```
null device 
          1 
```

Alternatively, you can close all open plots using:


```r
graphics.off()
```

#### Exercise 4.1: A simple linear regression model
1) Look at the Old Faithful geyser data in Yellowstone
   National Park.  It's the `faithful` dataset available in
   the base R distribution.  Use `help(faithful)` or `?faithful`
   to see its documentation.

2) Plot the waiting time to the next eruptions vs. the
   duration of the eruption.

3) Fit a simple linear regression model to predict waiting
   time from the eruption duration.

4) Overlay the fitted model on the plot with a red line.

#### Activity 4.2: Trellis plots

This example introduces making trellis (or lattice) plots
using the `lattice` package and the `mtcars` dataset.

Load the lattice package (for making trellis plots).


```r
library(lattice)
```

If the `lattice` package is not installed, you can follow the
instructions in Activity 4.3 to install it.

For convenience, attaching the data frame places it in the
search path so that we don't always have to reference `mtcars`
each time we want to extract a column from the data.


```r
attach(mtcars)
```

Now that we've attached it, notice how it appears in the
2nd position of R's search path:


```r
search()
```

```
 [1] ".GlobalEnv"        "mtcars"            "package:lattice"  
 [4] "package:xtable"    "package:buildDocs" "package:devtools" 
 [7] "package:tools"     "package:digest"    "package:knitr"    
[10] "package:markdown"  "package:whisker"   "ESSR"             
[13] "package:stats"     "package:graphics"  "package:grDevices"
[16] "package:utils"     "package:datasets"  "package:methods"  
[19] "Autoloads"         "package:base"     
```

Since `search()` returns a character vector, we could use the
following to verify `mtcars` is in the search path:


```r
"mtcars" %in% search()
```

```
[1] TRUE
```

And thus, instead of using either of these:


```r
head(mtcars$mpg)
```

```
[1] 21.0 21.0 22.8 21.4 18.7 18.1
```


```r
head(mtcars[, "mpg"])
```

```
[1] 21.0 21.0 22.8 21.4 18.7 18.1
```

We can simply use `mpg`:


```r
head(mpg)
```

```
[1] 21.0 21.0 22.8 21.4 18.7 18.1
```

In preparation for the lattice plots, we create factors with
value labels that will aid in annotation and in dividing the
data into groups based on the number of gears and the
number of cylinders.


```r
gear.f <- factor(gear, levels = c(3, 4, 5), labels = c("3gears", "4gears", "5gears"))
cyl.f <- factor(cyl, levels = c(4, 6, 8), labels = c("4cyl", "6cyl", "8cyl"))
```


Let's make a kernel density plot of mpg for all the vehicles.
A kernel density is a smoothed plot of the raw
data. Notice that `densityplot()` comes from the `lattice`
package.


```r
densityplot(~mpg, main = "Density Plot", xlab = "Miles per Gallon")
```

![plot of chunk unnamed-chunk-19](figures/knitr/unnamed-chunk-19-1.png) 

Kernel density plots for each cylinder type.  Notice
this is where we use the factor variable for cylinder.


```r
densityplot(~mpg | cyl.f, main = "Density Plot by Number of Cylinders", xlab = "Miles per Gallon")
```

![plot of chunk unnamed-chunk-20](figures/knitr/unnamed-chunk-20-1.png) 

Scatterplots of mpg vs. weight for each combination of
cylinder type and gear type.  `xyplot()` is another function
from the `lattice` package.


```r
xyplot(mpg ~ wt | cyl.f * gear.f, main = "Scatterplots by Cylinders and Gears", 
    ylab = "Miles per Gallon", xlab = "Car Weight")
```

![plot of chunk unnamed-chunk-21](figures/knitr/unnamed-chunk-21-1.png) 

Scatterplot matrix over a number of the columns:


```r
splom(mtcars[, c(1, 3:6)], main = "MTCARS Data")
```

![plot of chunk unnamed-chunk-22](figures/knitr/unnamed-chunk-22-1.png) 

Now that we're through with mtcars, we detach it from the
search path.


```r
detach(mtcars)
```

It's no longer there.


```r
"mtcars" %in% search()
```

```
[1] FALSE
```

Close the graphics window(s).


```r
graphics.off()
```

#### Exercise 4.2: Trellis plots

1) Attach the quakes data that comes with R. Look at the
   columns using `head()` or `str()`.

2) Use `xyplot` to plot lat vs. long for the location of the
   earthquakes. Label the axes and the main graphs
   using the following command to bin the depth variable into
   9 bins:

   `depthbin <- equal.count(quakes$depth, number = 9,
                            overlap = 0)`

   Make sure you have loaded the lattice package via:
   `library(lattice)`.

3) Now use xyplot() to plot lat,long for each depthbin of
   the earthquake to create a set of graphs in a trellis
   display.
