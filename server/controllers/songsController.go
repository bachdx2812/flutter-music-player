package controllers

import (
	"fmt"
	"server/initializers"
	"server/libs"
	"server/models"

	"github.com/gin-gonic/gin"
)

func SongCreate (c *gin.Context) {
	youtubeUrl := c.PostForm("youtubeUrl")
	fmt.Println(youtubeUrl)

	youtubeInfo := libs.GetYoutubeInfo(youtubeUrl)

	song := models.Song{
		Url: youtubeInfo.Url,
		Title: youtubeInfo.Title, 
		Author: youtubeInfo.Author, 
		CoverUrl: youtubeInfo.ThumbnailUrl,
	}

	result := initializers.DB.Create(&song)

	if result.Error != nil {
		c.Status(400)

		return
	}

	c.JSON(200, gin.H{
		"song": song,
	})
}