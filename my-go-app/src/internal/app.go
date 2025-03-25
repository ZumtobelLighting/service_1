package internal

import "fmt"

type App struct {
    Name    string
    Version string
}

func NewApp(name string, version string) *App {
    return &App{Name: name, Version: version}
}

func (a *App) Start() {
    fmt.Printf("Starting %s version %s...\n", a.Name, a.Version)
}