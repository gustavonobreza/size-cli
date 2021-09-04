$filebin = "size.exe";
$fullPath = "./bin/windows/amd64/$filebin"
$binExists = Test-Path -Path $fullPath

if ($binExists){
  Remove-Item -Force -Recurse -Confirm:$false ./bin/$filebin;
}



Write-Output "Building you app..."
go build  -o $fullPath .;
Write-Output "Finish!";