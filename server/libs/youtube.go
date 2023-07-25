package libs

import (
	"fmt"
	"regexp"
)

type YoutubeInfo struct {
	id string
	thumbnail string
}

func GetYoutubeInfo(url string) {
	var regex = `^.*(youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*`

	r, _ := regexp.Compile(regex)
	matches := r.FindStringSubmatch(url)

	youtubeInfo := YoutubeInfo{
		id: matches[2], 
		thumbnail: "https://img.youtube.com/vi/" + matches[2] + "/0.jpg",
	}

	fmt.Println(youtubeInfo)
}