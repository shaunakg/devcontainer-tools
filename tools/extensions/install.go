package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os/exec"
)

type Extensions []string

func main() {

	var data Extensions
	file, err := ioutil.ReadFile("/root/tools/extensions/extensions.json")

	if err != nil {
		log.Fatal(err)
	}

	err = json.Unmarshal(file, &data)
	if err != nil {
		log.Fatal(err)
	}

	for _, element := range data {

		app := "code-server"
		installFlag := "--install-extension"

		fmt.Printf("Installing %s\n", element)

		cmd := exec.Command(app, installFlag, element)
		stdout, err := cmd.Output()

		if err != nil {
			fmt.Println(err.Error())
		} else {
			// Print the output
			fmt.Println(string(stdout))
		}

	}

}
