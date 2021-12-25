<# 
General Notes
- Start with $ always
- Letter, Number and Underscores ONLY allowed
- No predefined functions should be used as variable names
- Any characters not allowed can be encompassed by {} #>

# Assign a value to a variable
$variableValue= 10

# Assign a single value to multiple variables
$variableValue=$integerValue=$a=1

# Assign the value to a variable in a single line
$p,$q,$r=10,34,23

# Multiple values to one variable i.e. arra
$listValue=123,12345,1234567,123,12345678,124

# Sort and get unique values in list variable
$listValue | sort | get-unique

