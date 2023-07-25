package main

import (
	"server/controllers"
	"server/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main () {
	r := gin.Default()

	r.POST("/songs", controllers.SongCreate)

	r.Run()
}