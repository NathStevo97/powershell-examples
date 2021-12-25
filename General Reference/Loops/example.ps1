# Generic For Loop Example
# <init> = initial condition for loop
# <condition> = final condition for for loop
# <repeat> = iteration
<#  
for (<init>; <condition>; <repeat>)
{code to be execute till the condition is true}
$arrayItem = @("Laptop", "Mobile", "Tablet")
for($i = 0; $i -lt $arrayItem.length; $i++)
{
$arrayItem[$i]
}
#>

# for Each Example
$arrayList = @("Laptop", "Mobile", "Tablet")
foreach ($item in $array)
{
$item
}

# While Loops
$arrayItem = @("Laptop", "Mobile", "Tablet")
$counter = 0;
while($counter -lt $arrayItem.length){
$arrayItem[$counter]
$counter += 1
}

# Do While Loop
$arrayItem = @(“laptop”, “Mobile”, “Tablet”)
$counter = 0;

do {
$arrayItem[$counter] $counter += 1
}
while($counter -lt $arrayItem.length)