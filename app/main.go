package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/google/go-tika/tika"
)

func main() {
	fmt.Println("Hello World")
	u := []string{"http://", os.Getenv("TIKA_URL")}
	tikaURL := strings.Join(u, "")
	client := tika.NewClient(nil, tikaURL)
	body, err := client.Version(context.Background())
	if err != nil {
		log.Println("Error in Tika client version", err)
	}
	fmt.Println(body)
}
