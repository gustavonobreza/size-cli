$filebin = "size.exe";
$fullPath = "./bin/$filebin"
$binExists = Test-Path -Path $fullPath

if ($binExists){
  Remove-Item -Force -Recurse -Confirm:$false ./bin/$filebin;
}



echo "Building you app..."
go build  -o bin/$filebin .;
echo "Finish!";