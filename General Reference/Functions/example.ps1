<#
Generic Example:

function functionName
{
code
}

#>

# Simple Function - No Parameter
function displayDate {
    Get-Date
}

# Simple Parameter-based function
function dividedValue {
    Param ([int]$x, [int]$y)
    $z = $x / $b
    Write-Output $z
}

# Factorial Example
function Factorial-Of-A-Number([int]$number) {
    if ($number -lt 0) {
        $factValue = 0
    }
    elseif ($number -le 1) {
        $factValue = 1
    }
    else {
        $factValue = $number * (Get-Factorial($number - 1))
    }
    return $factValue
}
$number = Read-Host 'Enter a value'
$factValue = Factorial-Of-A-Number $number
Write-Output "$number! = $factValue"