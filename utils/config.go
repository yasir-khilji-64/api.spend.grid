package utils

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)

func LoadEnvVariables() error {
	err := godotenv.Load(".env")
	if err != nil {
		return err
	}
	requiredVars := []string{"PORT"}

	for _, envVar := range requiredVars {
		value, exists := os.LookupEnv(envVar)
		if !exists || value == "" {
			err := fmt.Sprintf("Missing or empty environment variable: %s", envVar)
			return fmt.Errorf(err)
		}
	}

	return nil
}
