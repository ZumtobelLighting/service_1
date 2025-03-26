package main

import (
	"fmt"
	"log"
	"os"
	"time"
)

func main() {
	log.Println("Starting simple logging service...")
	
	// Get version from environment or use default
	version := os.Getenv("VERSION")
	if version == "" {
		version = "dev"
	}
	
	// Log every 5 seconds
	for {
		log.Printf("Simple logging service running - version: %s, time: %s", 
			version, time.Now().Format(time.RFC3339))
		time.Sleep(5 * time.Second)
	}
}
