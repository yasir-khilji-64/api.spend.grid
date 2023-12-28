# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) go
VERSION=0.0.1
BINARY_NAME=spendgrid
APP_NAME=main.go
ENV_FILE=./.env
INPUT_DIR=./cmd
OUTPUT_DIR=./bin

all: build

build:
	@echo "🛠️ Building $(BINARY_NAME)-$(VERSION)..."
	@ENV_FILE=$(ENV_FILE) $(GOBUILD) -o $(OUTPUT_DIR)/$(BINARY_NAME) -v $(INPUT_DIR)/$(APP_NAME)

clean:
	@echo "🧹 Cleaning..."
	@$(GOCLEAN)
	@rm -f $(OUTPUT_DIR)/*

test:
	@echo "⚙️  Running tests..."
	@$(GOTEST) -v ./...

run: build
	@echo "🚀 Running $(BINARY_NAME)..."
	@$(OUTPUT_DIR)/$(BINARY_NAME)

.PHONY: all build clean test run
