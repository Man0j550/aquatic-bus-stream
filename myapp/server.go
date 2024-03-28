package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"github.com/rs/cors"
)

var db *sql.DB


type Login struct {
	Username string `json: "UserName"`
	Email    string `json: "email"`
	Password string `json : "password"`
}

func connectDB() *sql.DB {
	// Capture connection properties.
	cfg := mysql.Config{
		User:                 "root",
		Passwd:               "root",
		Net:                  "tcp",
		Addr:                 "localhost:3306",
		DBName:               "myproject",
		AllowNativePasswords: true,
	}
	// Get a database handle.
	var err error
	db, err = sql.Open("mysql", cfg.FormatDSN())
	if err != nil {
		log.Fatal(err)
	}

	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	fmt.Println("Connected!")
	// Now you can execute SQL queries using the 'db' object
	return db
}

func main() {

	e := echo.New()
	db := connectDB()

	e.Use(echo.WrapMiddleware(cors.Default().Handler))
	e.GET("/", func(c echo.Context) error {

		return c.String(http.StatusOK, "Hello, World!")
	})
	e.POST("/send-data", func(c echo.Context) error {
		var data map[string]string
		fmt.Println("Hello")

		if err := c.Bind(&data); err != nil {
			return err
		}
		fmt.Println(data);
		rows, err := db.Query("SELECT email, password FROM user WHERE email = ? AND password = ?", data["Email"], data["Pass"])
		if err != nil {
			panic(err.Error())
		}
		defer rows.Close()

		// Process the query results
		rowCount := 0

		for rows.Next() {
			var username string
			var password string
			if err := rows.Scan(&username, &password); err != nil {
				panic(err.Error())
			}
			rowCount++
			fmt.Printf("%s  %s\n", username, password)
			print("Login Successful :)")

		}

		if rowCount == 0 {
			return c.String(http.StatusNotFound, "user not found")
		}

		return c.String(http.StatusOK, "Data Sent Successfully")
	})

	e.POST("/Createaccount", func(c echo.Context) error {
		db := connectDB()
		var data Login
		if err := c.Bind(&data); err != nil {
			return err
		}
		fmt.Println(data)

		if(data.Username == "" || data.Email == "" || data.Password == ""){
			return c.String(400, "Please fill all fields.")
		}

		_, _ = db.Exec("INSERT INTO user (username,email,password) VALUES (?, ?, ?)",
			data.Username, data.Email, data.Password)

		return c.String(http.StatusOK, "Data inserted successfully")
	})

	e.Logger.Fatal(e.Start(":8080"))
}
