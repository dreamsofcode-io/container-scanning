package main

import (
	"text/template"

	"github.com/gin-gonic/gin"
)

func main() {
	server := gin.Default()

	server.GET("/", func(ctx *gin.Context) {
		tmpl, err := template.New("foo").Parse("<h1>Hello World</h1>")
		if err != nil {
			ctx.JSON(500, gin.H{"error": err.Error()})
		}

		tmpl.Execute(ctx.Writer, nil)
	})

	server.Run(":8080")
}
