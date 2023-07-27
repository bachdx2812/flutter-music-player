package controllers

import (
	"net/http"
	"server/app/initializers"
	"server/app/libs"
	"server/app/models"
	"strings"

	"github.com/gin-gonic/gin"
)

func SongsList (c *gin.Context) {
	var songs []models.Song
	initializers.DB.Find(&songs)

	c.JSON(200, gin.H {
		"songs": songs,
	})
}

func SongDetail (c *gin.Context) {
	id := c.Param("id")

	var song models.Song
	initializers.DB.First(&song, id)

	c.JSON(200, gin.H {
		"song": song,
	})
}

func SongCreate (c *gin.Context) {
	youtubeUrl := c.PostForm("youtubeUrl")
	
	if len(strings.TrimSpace(youtubeUrl)) == 0 {
		c.JSON(403, gin.H{
			"error": "youtube url cant be empty",
		})
	}

	youtubeInfo := libs.GetYoutubeInfo(youtubeUrl)

	song := models.Song{
		Url: youtubeInfo.Url,
		Title: youtubeInfo.Title, 
		Author: youtubeInfo.Author, 
		CoverUrl: youtubeInfo.ThumbnailUrl,
	}

	result := initializers.DB.Create(&song)

	if result.Error != nil {
		c.JSON(403, gin.H{
			"error": result.Error,
		})

		return
	}

	c.JSON(http.StatusOK, gin.H{
		"song": song,
	})
}