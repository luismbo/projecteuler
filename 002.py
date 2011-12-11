#!/usr/bin/env python

from itertools import takewhile, ifilter

def fib():
    yield 1
    a,b = 1,2
    while True:
        yield b
        a,b = b,a+b

def iseven(n):
    return n % 2 == 0

def euler002():
    return sum(ifilter(iseven, takewhile(lambda x: x < 4e6, fib())))

if __name__ == "__main__":
    print euler002()
