package main

import "fmt"

func main() {
	create_user("test@gmail.com", "passwd")
}

func create_user(email, password string) {
	q := `
		INSERT INTO users (email, password)
		VALUES (%s, %s)
	`

	fmt.Println(fmt.Sprintf(q, email, password))
}
