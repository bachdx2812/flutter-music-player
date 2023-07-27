package main

import (
	"server/app/controllers"
	"server/app/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main () {
	r := gin.Default()

	r.GET("/songs", controllers.SongsList)
	r.GET("/songs/:id", controllers.SongDetail)
	r.POST("/songs", controllers.SongCreate)

	r.Run()
}