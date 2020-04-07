package main

import (
	"net/http"
	"net/http/httputil"
	"net/url"
)

func main() {
	u, _ := url.Parse("http://localhost:1234")
	rp := httputil.NewSingleHostReverseProxy(u)
	http.Handle("/", rp)
	if err := http.ListenAndServe(":1235", nil); err != nil {
		panic(err)
	}
}
