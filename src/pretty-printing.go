// https://stackoverflow.com/questions/27117896/pretty-printing-golang-variable

package main

import (
    "encoding/json"
    "fmt"
)

func main() {
    x := map[string]interface{}{"a": 1, "b": 2}
    b, err := json.MarshalIndent(x, "", "  ")
    if err != nil {
        fmt.Println("error:", err)
    }
    fmt.Print(string(b) + "\n")
}


// output
// {
//   "a": 1,
//   "b": 2
// }
