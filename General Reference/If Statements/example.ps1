# Generic Example
$x = 60
$y=70
if($x -le $y){
write-host("x is smaller than y")
}

# If... Else
$x = 60
$y=50
if($x -le $y){
write-host("x is smaller than y")
}
else
{
write-host("x is greater than y")
}

# If.... ElseIf.... Else
$x = 30
$y=30
if($x -ne $y){
write-host("x not equal to y")
} elseif($x -ge $y){
write-host("x is greater than y")
} elseif($x-le$y){
write-host("x is less than y")
}
else
{
write-host("x is equal to y")
}

# Nested If Statements
$x = 30
$y = 10
$z =5
if($x -gt $y){
if($x -gt $z) {
write-host(“X is larger than y and z”)
}
}