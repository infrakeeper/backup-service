package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println(time.Now())
		time.Sleep(5 * time.Second)
	}
}
