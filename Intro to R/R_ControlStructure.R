##############################################################
# IST 3420-Intro to Data Science & Management                #
# FUNCTION & CONTROL STRUCTURES                              #
# Cui Zou                                                    #
##############################################################

# Function
f2c <- function(f){
  # Fahrenheit to Celsius conversion
  c <- (f-32)*5/9
  return(c)
}

f2c(90)
f2c(32)
typeof(f2c)


# Statement
x <- 0; x + 5  # Use either ";" or new line to separate statements

y <- c(1,2,3,
       4,5,6)
# The new line is ignored,as the statement is not syntactically complete
y

# Block
b = {a <- 0
  a + 5}
b


# One-way selection
is.even <- function(x){
  if(x%%2==0){
    return(TRUE)
  }
}

is.even(24)
is.even(23)
is.even(10.5)

# Two-way selection
is.even2 <- function(x){
  if(x%%2==0){
    return(TRUE)
  } else{
    return(FALSE)
  }
}

is.even2(24)
is.even2(23)
is.even2(10.5)

# Multi-way selection
score2grade <- function(score){
  if(score >= 90) return("A")
  else if (score >=80) return("B")
       else if (score >= 70) return("C")
            else if (score >= 60) return("D")
                 else return("F")
}

score2grade(99)
score2grade(90.1)
score2grade(89.9)
score2grade(70.1)
score2grade(68.6)
score2grade(57)

score2grade(-10) # not possible in reality, then how to deal with wrong input? See line 107-109

# Looping

score_v <- sample(50:100, 100, replace=T)  # Generate random scores for 100 students
print(score_v)

# Use for loop
grade_v <- NULL  # Initiate a grade vector
for (i in 1:100){
  grade_v[i] = score2grade(score_v[i])
}
print(grade_v)  # Show the grades calculated

# Use while loop
grade_v <- NULL
i <- 1
while (i <= 100){
  grade_v[i] = score2grade(score_v[i])
  i <- i + 1
}
print(grade_v)  # Show the grades calculated


# Read a line from the terminal (in interactive use)
z <- readline("Please input the value of z?")
z  # Type of z is character
class(z)
# Read a numeric value from the terminal
w <- as.numeric(readline("Please input the value of w?"))
w
class(w)  # Type of w is numeric

# Handle some bad input values
score2grade_v2 <- function(score){
  while(score < 0 | score > 100){
    score <- as.numeric(readline("Input score (between 0 and 100)?"))
  }
  if(score >= 90) return("A")
  else if (score >=80) return("B")
       else if (score >= 70) return("C")
            else if (score >= 60) return("D")
                 else return("F")
}


score2grade_v2(-1)
score2grade_v2(87)
score2grade_v2(200)

# Another way is to wrap the original score2grade function
score2grade_v3 <- function(score){
  while(score < 0 | score > 100){
    score <- as.numeric(readline("Input score (between 0 and 100)?"))
  }
  score2grade(score)
}

score2grade_v3(-1)
score2grade_v3(87)
score2grade_v3(200)

# Use repeat loop
grade_v <- NULL
i <- 1
repeat {
  grade_v[i] = score2grade(score_v[i])
  i <- i + 1
  if (i == 101) break
}
print(grade_v)  # Show the grades calculated


# Break Demo: get the sum of 1,2,3,... until it's larger than or equal to 100.
breakdemo <- function(){
  sum <- 0
  i <- 0
  while(i < 20){
    i <- i +1
    if (sum >= 100)
      break
    sum <- sum + i
  }
  cat("The i is",i,"\n")
  cat("The sum is",sum,"\n")
}

breakdemo()


# Next Demo: get the sum of 1,2,...,19,20, but bypass 10 and 11.
nextdemo <- function(){
  sum <- 0
  i <- 0
  while(i < 20){
    i <- i +1
    if (i == 10 | i ==11)
      next
    sum <- sum + i
  }
  cat("The i is",i,"\n")
  cat("The sum is",sum,"\n")
}

nextdemo()

# Messages
is_numberic <- function(x){
  if(is.numeric(x)){
    if (x>0){
      return(1);
    }
    if (x==0){
      warning("Input is zero!")
      return(NaN)
    } else {
      return(-1)
    }
    
  } else{
    stop("Input number be a number!")
  }
}

is_numberic("a")
is_numberic(-23)
is_numberic(0)
is_numberic(10.5)
is_numberic(TRUE)


message("Hello there!")
print("Hello there!")


