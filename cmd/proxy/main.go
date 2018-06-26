package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter().StrictSlash(true)
	r.HandleFunc("/status/{ip4}", handleStatus).Methods("GET")

	http.Handle("/", r)

	port := os.Getenv("PORT")
	log.Printf("listening on port %v...", port)
	if err := http.ListenAndServe(fmt.Sprintf(":%v", port), nil); err != nil {
		log.Fatalf("cannot listen on port %v: %v", port, err)
	}
}

func handleStatus(w http.ResponseWriter, r *http.Request) {

	ip4, ok := mux.Vars(r)["ip4"]
	if !ok {
		w.WriteHeader(400)
		w.Write([]byte("invalid ip4 address"))
		return
	}

	res, err := http.DefaultClient.Get(fmt.Sprintf("http://%v:18515/status", ip4))
	if err != nil {
		w.WriteHeader(500)
		w.Write([]byte("cannot forward request: " + err.Error()))
		return
	}
	defer res.Body.Close()

	data, err := ioutil.ReadAll(res.Body)
	if err != nil {
		w.WriteHeader(500)
		w.Write([]byte("cannot read response: " + err.Error()))
		return
	}

	w.Header()["Content-Type"] = []string{"application/json"}
	w.Write(data)
}
