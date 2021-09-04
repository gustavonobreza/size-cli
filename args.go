package main

import (
	"errors"
	"os"
	"path/filepath"
	"runtime"
	"strings"
)

func parseArgs() (string, string, error) {
	cwd, _ := os.Getwd()
	args := os.Args

	if len(args) < 2 {
		return "", "", errors.New("arguments is missing")
	}

	name := args[1]

	if !strings.HasPrefix(name, ".") {
		name = "./" + name
	}

	fullfilepath, _ := filepath.Abs(filepath.Join(cwd + name))

	var filename string

	if runtime.GOOS == "windows" {
		splitted := strings.Split(fullfilepath, "\\")
		filename = splitted[len(splitted)-1]
	} else {
		splitted := strings.Split(fullfilepath, "/")
		filename = splitted[len(splitted)-1]
	}

	return fullfilepath, filename, nil
}
