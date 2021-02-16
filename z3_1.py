#!/usr/bin/python
from z3 import *

x = Real('x')
s = Solver()
s.add(x*x - 2*x + 1 == 0)
print s.check()
print s.model()

