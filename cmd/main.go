package main

import (
	"fmt"
	"os"

	"github.com/yasir-khilji-64/api.spend.grid/utils"
)

func main() {
	err := utils.LoadEnvVariables()
	if err != nil {
		fmt.Print(err)
		return
	}
	fmt.Println("Hello, World. This is a new test")
	fmt.Println(os.Getenv("PORT"))
}
