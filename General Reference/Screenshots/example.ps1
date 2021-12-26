# Get Screen Information
$ScreenInformation = [System.Windows.Forms.SystemInformation]::VirtualScreen
$ScreenWidth = $ScreenInformation.Width
$ScreenHeight = $ScreenInformation.Height
$Left = $ScreenInformation.Left
$Top = $ScreenInformation.Top

# Create BitmapObject to store image
$BitmapObject = New-Object System.Drawing.Bitmap $ScreenWidth, $ScreenHeight

# Create Graphic Object
$GraphicObject = [System.Drawing.Graphics]::FromImage($BitmapObject)
# Use graphic object and copyfromscreen method to capture information
$GraphicObject.CopyFromScreen($Left, $Top, 0, 0, $BitmapObject.Size)

# Save screenshot to particular location
$File = "D:\Padmini files\newscreenshot.png"
$BitmapObject.Save($File)

# Full Example
$File = "D:\Padmini files\newscreenshot.png"
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing
$ScreenInformation = [System.Windows.Forms.SystemInformation]::VirtualScreen
$ScreenWidth = $ScreenInformation.Width
$ScreenHeight = $ScreenInformation.Height
$Left = $ScreenInformation.Left
$Top = $ScreenInformation.Top
$BitmapObject = New-Object System.Drawing.Bitmap $ScreenWidth, $ScreenHeight
$GraphicObject = [System.Drawing.Graphics]::FromImage($BitmapObject)
$GraphicObject.CopyFromScreen($Left, $Top, 0, 0, $BitmapObject.Size)
$BitmapObject.Save($File)
Write-Output "Screenshot saved to your file:"
Write-Output $File