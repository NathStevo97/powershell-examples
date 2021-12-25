# Switch statement is a series of if statememts
# Used for checking multiple conditions

# Declare a variable
# switch($season) means switch(1)

$season = 1
switch ( $season )
{
0 { $result = 'Summer' }
1 { $result = 'Winter' }
2 { $result = 'rain' }
}
write-host($result)