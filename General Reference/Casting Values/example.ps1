# Casting is used when carrying out an operation with different datatype value -> Converts data type

# In following example, one variable is string the other is double type
# $StringValue = "PowerShell" 
# $DoubleValue = 2.0
# $SumValue = $StringValue + $DoubleValuewrite-output $SumValue

Trace-Command -Name TypeConversion -pshost {[string]$DoubleValue + $StringValue}