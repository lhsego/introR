
## Activities ##

### Activity 1: Preliminaries ###

#### Activity 1.1: Help commands

After entering any computer program, it's always a good idea to know how to exit.  
To quit R at any time, simply type the following at the prompt:


```r
q()
```

When you don't know exactly what you're looking for,
search for a topic.  There are two ways to do this:


```r
help.search("graphics")
??graphics
```

When you know the name of the R function, e.g. the function
`rnorm()` that generates random normal data, there are two ways to do this:

```r
help(rnorm)
?rnorm
```


Sometimes you just need a reminder about the arguments (the
inputs) of a function.  The `args()` function can help in
this situation.  Here are the arguments for the `rnorm()`
function:

```r
args(rnorm)
```

```
function (n, mean = 0, sd = 1) 
NULL
```

Examples are often included in the documentation of functions
at the bottom of the documentation.  Look at the bottom of
the help file of the `seq()` function:

```r
?seq
```

You can execute the example code for a function all at once
using the `example()` function:


```r
example(seq)
```

```

seq> seq(0, 1, length.out = 11)
 [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

seq> seq(stats::rnorm(20)) # effectively 'along'
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

seq> seq(1, 9, by = 2)     # matches 'end'
[1] 1 3 5 7 9

seq> seq(1, 9, by = pi)    # stays below 'end'
[1] 1.000000 4.141593 7.283185

seq> seq(1, 6, by = 3)
[1] 1 4

seq> seq(1.575, 5.125, by = 0.05)
 [1] 1.575 1.625 1.675 1.725 1.775 1.825 1.875 1.925 1.975 2.025 2.075
[12] 2.125 2.175 2.225 2.275 2.325 2.375 2.425 2.475 2.525 2.575 2.625
[23] 2.675 2.725 2.775 2.825 2.875 2.925 2.975 3.025 3.075 3.125 3.175
[34] 3.225 3.275 3.325 3.375 3.425 3.475 3.525 3.575 3.625 3.675 3.725
[45] 3.775 3.825 3.875 3.925 3.975 4.025 4.075 4.125 4.175 4.225 4.275
[56] 4.325 4.375 4.425 4.475 4.525 4.575 4.625 4.675 4.725 4.775 4.825
[67] 4.875 4.925 4.975 5.025 5.075 5.125

seq> seq(17) # same as 1:17, or even better seq_len(17)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
```

#### Activity 1.2: Demos


Some R packages include demonstrations you can run to learn
about their capability.  Be sure to hit "Enter" to
cycle through the components of each demo.

Here's one from the `graphics` package, which gives a nice
demonstration of the breadth of graphical capability in R.


```r
demo("graphics")
```

And here's one about generalized linear models (glm):

```r
demo(lm.glm)
```


#### Activity 1.3:  R as a calculator
Addition:

```r
7 + 3
```

```
[1] 10
```

Subtraction:

```r
7 - 3
```

```
[1] 4
```

Multiplication:

```r
7 * 3
```

```
[1] 21
```

Division:

```r
7 / 3
```

```
[1] 2.333333
```

Integer division:

```r
7 %/% 3
```

```
[1] 2
```

Division remainder (the modulo):

```r
7 %% 3
```

```
[1] 1
```

Exponentiation:

```r
exp(7)
```

```
[1] 1096.633
```

Natural logarithm:

```r
log(7)
```

```
[1] 1.94591
```

Base 10 log:

```r
log10(1000)
```

```
[1] 3
```

Examples of common mathematical functions and constants:

```r
sqrt(16)
```

```
[1] 4
```

```r
cos(pi)
```

```
[1] -1
```

Powers:  2 to the 5th:

```r
2^5
```

```
[1] 32
```

Large and small numbers:

```r
1.7e+05
```

```
[1] 170000
```

```r
1.7e-03
```

```
[1] 0.0017
```

And there are numerous statistical functions.  For example:
The probability a standard normal random variable takes
a value of 1.96 or lower:

```r
pnorm(1.96)
```

```
[1] 0.9750021
```

And the probability of 4 heads in 12 fair coin flips:

```r
dbinom(4, 12, 0.5)
```

```
[1] 0.1208496
```

And, best of all, it handles division by 0 gracefully :) 

```r
1 / 0
```

```
[1] Inf
```

R can also perform all the standard matrix operations:
inner and outer products, matrix multiplication, matrix
inversion, transpose, eigen vectors and values, various
decompositions, etc.  It has built-in numerical routines for
root-finding, optimization, integration, differentiation,
etc.

