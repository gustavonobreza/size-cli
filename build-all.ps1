$filebin = "size";
$OSs = @('windows', 'linux', 'darwin')
$basePath = ".\bin\"
$plataforms = @('amd64', 'arm64')

Write-Output "Building your app..."

if (!(Test-Path -Path $basePath)) {
	mkdir $basePath | Out-Null
}

foreach ($os in $OSs) {
	$osPath = $basePath + $os

	# Delete Folder if exists
	if (Test-Path -Path $osPath) {
		Remove-Item -Force -Recurse -Confirm:$false $osPath;
	}

	foreach ($plataform in $plataforms) {
		$binpath = ($basePath + $os + "\" + $plataform + "\" + $filebin)

		if ($os -eq "windows") {
			$binpath += '.exe'
		}
	
		Write-Output "Building $os/$plataform"

		$env:GOOS = $os; $env:GOARCH = $plataform; go build -o $binpath .;
	}
}

Write-Output "Finished!";
