package main

import (
    "fmt"
    "strings"
)

func main() {

    // Create a string containing a candle string
    candleString := "*   *\n" +
                    "*   *\n" +
                    "*****\n" +
                    "*   *\n" +
                    "*   *"

    // Split the string into an array of candle strings
    candles := strings.Split(candleString, "\n")

    // Loop over the array for 3 times
    for i := 0; i < 3; i++ {
        // Loop over the lines in the array
        for _, line := range candles {
            // Print the candle string
            fmt.Println(line)
        }
    }

    // Print a blank line
    fmt.Println()

    // Create a string of 4 x's
    xString := strings.Repeat("X", 4)

    // Print the xString
    fmt.Println(xString)
}