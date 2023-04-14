package main

import (
	"testing"
)

func TestTableCalculate(t *testing.T) {
	var tests = []struct {
		input1   int
		input2   int
		expected int
	}{
		{2, 2, 4},
		{-1, 1, 0},
		{0, -1, -1},
		{-5, 6, 1},
		{99999, 3, 100002},
	}

	for _, test := range tests {
		if output := Calculate(test.input1, test.input2); output != test.expected {
			t.Error("Test Failed: {} and {} inputted, {} expected, recieved: {}", test.input1, test.input2, test.expected, output)
		}
	}
}
