# Hashtables are arrays to store key-value pairs
# Create Empty Hashtable
$NumberList=@{}

# Create Example Hashtable
$hash = @{ ID = 13; Name = "Purnima"; Color = "fair"}

# Example Hashtable Operations
$HashValue= @{ ID = 13; Name = "Purnima"; Color = "fair"}
write-host("Print all hashtable keys")
$HashValue.keys
write-host("Print all hashtable values")
$HashValue.values
write-host("Get ID")
$HashValue["ID"]
write-host("print Size")
$HashValue.Count
write-host("Add key-value")
$HashValue["Updated"] = "Now"
write-host("sort by key")
$HashValue.GetEnumerator() | Sort-Object -Property key