package main

import (
	"fmt"
)

func isInt(s string) bool {
	var r = []rune(s)
	l := len(r)
	i := 0

	goto S0
S0:
	if i >= l {
		goto S4
	} else if r[i] == '+' || r[i] == '-' {
		i++
		goto S1
	} else if '0' <= r[i] && r[i] <= '9' {
		i++
		goto S2
	} else {
		goto S4
	}
S1:
S2:
S3:
	return true
S4:
	return false
}

func main() {
	tests := []struct {
		s string
		b bool
	}{
		{"", false},
		{" ", false},
		{"+", false},
		{"-", false},
		{"++", false},
		{"--", false},
		{"+0+", false},
		{"-0-", false},
		{"+0123456789", true},
		{"-0123456789", true},
		{"0123456789", true},
	}
	for _, t := range tests {
		fmt.Printf("%s\t'%s'\n", map[bool]string{true: "OK", false: "NG"}[t.b == isInt(t.s)], t.s)
	}
}
