package libs

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"regexp"
)

type YoutubeInfo struct {
	// ThumbnailHeight int
	Url string `json:"url"`
	ThumbnailUrl string `json:"thumbnail_url"`
	Title string `json:"title"`
	Author string `json:"author_name"`
}

func GetYoutubeInfo  (url string) YoutubeInfo {
	var regex = `^.*(youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*`

	r, _ := regexp.Compile(regex)
	matches := r.FindStringSubmatch(url)
	videoId := matches[2]

	resp, err := http.Get("https://noembed.com/embed?format=json&url=" + "https://www.youtube.com/watch?v=" + videoId) 

	if err != nil {
		fmt.Println(err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}

	fmt.Println(string(body))
	var result YoutubeInfo
	fmt.Println("body: ", json.Unmarshal([]byte(string(body)), &result))

	return result
}