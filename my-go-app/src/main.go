package main

import (
    "log"
    "net/http"
    "my-go-app/internal"
)

func main() {
    app := internal.NewApp()

    http.HandleFunc("/", app.HandleRequest)

    log.Println("Starting server on :8080")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatalf("Could not start server: %s\n", err)
    }
}