#!/bin/bash

# uses squeeze option to replaces repeated characters with a single instance. In this case, we're replacing instances such as "    " with " "

tr -s " "