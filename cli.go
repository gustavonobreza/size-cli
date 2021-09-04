package main

import (
	"errors"
	"fmt"
	"os"
)

func main() {
	filepath, filename, err := parseArgs()

	if err != nil {
		println(err.Error())
		return
	}

	size, unit, err := getStats(filepath)

	if err != nil {
		println(err.Error())
		return
	} else {
		phrase := fmt.Sprintf("%s has %.2f %s", filename, size, unit)
		println(phrase)

	}

}

var (
	kilobyte float64 = 1024
	megabyte float64 = kilobyte * 1000
	gigabyte float64 = megabyte * 1000
	terabyte float64 = gigabyte * 1000
)

func getStats(path string) (float64, string, error) {

	fileInfo, _ := os.Stat(path)

	if fileInfo.IsDir() {
		return 0, "", errors.New("error: It is a directory, please select a file")
	}

	var unity string
	sizeRaw := fileInfo.Size()
	var size float64

	if float64(sizeRaw) >= terabyte {
		size = float64(sizeRaw) / terabyte
		unity = "TB"
	} else if float64(sizeRaw) > gigabyte {
		size = float64(sizeRaw) / gigabyte
		unity = "GB"
	} else if float64(sizeRaw) > megabyte {
		size = float64(sizeRaw) / megabyte
		unity = "MB"
	} else if float64(sizeRaw) > kilobyte {
		size = float64(sizeRaw) / kilobyte
		unity = "KB"
	} else {
		unity = "B"
		size = float64(sizeRaw)
	}

	return size, unity, nil
}
