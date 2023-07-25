package models

import "gorm.io/gorm"

type Song struct {
	gorm.Model
	Title string
	Description string
	Url string
	CoverUrl string
}