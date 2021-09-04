$filebin = "size";
$OSs = @('windows', 'linux', 'darwin')
$basePath = ".\bin\"
$plataforms = @('amd64', 'arm64')


foreach ($os in $OSs) {
	foreach ($plataform in $plataforms) {
		$binpath = ($basePath + $os + "\" + $plataform + "\" + $filebin)

		if ($os -eq "windows") {
			$binpath += '.exe'
		}
		
		$binExists = Test-Path -Path ($binpath)

		# Write-Output $binpath
		if ($binExists) {
			Remove-Item -Force -Recurse -Confirm:$false $binpath;
		}

		Write-Output "go build -o $binpath"

		$env:GOOS = $os; $env:GOARCH = $plataform; go build -o $binpath .;

	}
}


#echo "Building you app..."
#go build  -o bin/$filebin .;
#echo "Finish!";
