#!/bin/bash
fizzbuzz() {
[[ 0 -eq "($1%3)+($1%5)" ]] && { echo "Fizz Buzz"; exit 1; }
[[ 0 -eq "($1%3)" ]] && echo "Fizz";
[[ 0 -eq "($1%5)" ]] && echo "Buzz";
}

fizzbuzz 9
fizzbuzz 10
fizzbuzz 15
