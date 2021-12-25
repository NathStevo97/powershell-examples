# Arrays - Store a collection of the same type of item or a different type of item
# Comma-Separated Array
$N=1,2,3,4,5,6

# 3-Dot Separated Values
$N=1..6

# Note: Each array is created as an object array
$NumberList = 1,2,3,4,5,6,7,8
write-host("Display all the Array element:")
$NumberList
write-host("Get the length of array:")
$NumberList.Length
write-host("Get fourth element of array")
$NumberList[3]
write-host("Get partial array")
$subList = $NumberList[1..3]
write-host("print subList")
$subList
write-host("using for loop")
for ($i = 0; $i -le ($NumberList.length - 1); $i += 1) {
$NumberList[$i]
}
write-host("Assign values")
$NumberList[1] = 10
$NumberList