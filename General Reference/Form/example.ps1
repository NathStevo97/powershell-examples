# Example
Add-Type -AssemblyName System.Windows.Forms
$NewForm = New-Object Windows.Forms.Form # Create form
$NewForm.Size = New-Object Drawing.Size @(250,150) # Set size
$NewForm.StartPosition = "CenterScreen" # Set form
$Button = New-Object System.Windows.Forms.Button # create button for form
$Button.add_click({Get-Date|Out-Host}) # customize button
$Button.Text = "Click here"
$NewForm.Controls.Add($Button) # add button to form object
$Dialouge = $NewForm.ShowDialog()