package models

import "gorm.io/gorm"

type Song struct {
	gorm.Model
	Title string
	Author string
	Url string
	CoverUrl string
}