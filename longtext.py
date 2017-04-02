#!/usr/bin/python

import sys
import random

inputText = sys.argv[1]
outputText = ""
for char in inputText:
  if char != ' ':
    for i in range(0, random.randint(1,5)):
      outputText += char
  else:
    outputText += char
print(outputText)
