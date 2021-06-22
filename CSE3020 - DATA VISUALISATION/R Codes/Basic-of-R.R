
#multiply a matrix with its transpose.
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
print(t(M))
t = M %*% t(M)
print(t)

#looping repeat statement
v <- c("Hello","loop")
cnt <- 2

repeat {
  print(cnt)
  print(v)
  cnt <- cnt+1

  if(cnt > 5) {
    break
  }
}

#while loop
v <- c("Hello","while loop")
cnt <- 2

while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}


#for loop
v <- LETTERS[1:4]
for ( i in v) {
  print(i)
}



# Create a function to print squares of numbers in sequence.
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}


# Call the function new.function supplying 6 as an argument.
new.function(6)


# Get the max salary from data frame.
sal <- max(data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)

retval <- subset( data, dept == "IT")
print(retval)

info <- subset(data, salary > 600 & dept == "IT")
print(info)

retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

write.csv(retval,"D:/R Workshop/output.csv")
newdata <- read.csv("D:/R Workshop/output.csv", nrows=2)
print(newdata)


df=data.frame(X=5,id=5,name='Rayon',salary=12000,start_date= '2014-11-15',dept='IT')
df


write.table(df, "D:/R Workshop/output.csv", append = TRUE,sep = ",",
            col.names = FALSE,
            row.names = FALSE,
            quote = FALSE)

install.packages("xlsx")
library("xlsx")
mydata <- read.xlsx("D:/R Workshop/mydata.xls", sheetIndex=1)
mydata
