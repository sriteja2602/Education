"A data frame is a table or a two-dimensional array-like structure in which
each column contains values of one variable and each row contains one set
of values from each column.
Following are the characteristics of a data frame.
??? The column names should be non-empty.
??? The row names should be unique.
??? The data stored in a data frame can be of numeric, factor or character
type.
??? Each column should contain same number of data items."

# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5),
  emp_name = c("Ram","Alex","Raj","Ryan","siva"),
  salary = c(623.3,515.2,611.0,729.0,843.25),
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15",
  NA,"2015-03-27")),
  stringsAsFactors = FALSE
)
# Print the data frame.
print(emp.data)


# Get the structure of the data frame.
str(emp.data)

# Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)

# Extract first two rows.
result <- emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

# Add the "dept" coulmn.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)

#check dataframe
print(is.data.frame(emp.data))
print(ncol(emp.data))
print(nrow(emp.data))

#null
sum(is.na(emp.data$start_date))
sum(is.na(emp.data))

#sort
print(emp.data[order(emp.data$salary),])

# Get the max salary from data frame.
sal <- max(emp.data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(emp.data, salary == max(salary))
print(retval)

retval <- subset(emp.data, dept == "IT")
print(retval)

info <- subset(emp.data, salary > 600 & dept == "IT")
print(info)

retval <- subset(emp.data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

write.csv(retval,"E:/COURSE/Data-Visualization/R-Lan/Prog/output.csv")
newdata <- read.csv("E:/COURSE/Data-Visualization/R-Lan/Prog/output.csv", nrows=2)
print(newdata)



