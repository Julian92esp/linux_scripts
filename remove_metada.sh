#!/bin/bash

# Delete all metadata from any type of file 

# The program exiftool is required

exiftool -all= -overwrite_original -ext "*" .