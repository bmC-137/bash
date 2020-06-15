#!/bin/bash

# To use, best cat the file and pipe bash it inside the required directory.

for i in *; do find ./"$i" -maxdepth 0 -type d -exec echo "For Directory:" {} \; ; for f in $i ; do echo -e "Count All Files:"; find ./"$f" -mindepth 1 -type f -exec echo \;|wc -l; echo "Count Sub-Directories:"; find ./"$f" -mindepth 1 -type d -exec echo \;|wc -l; echo "Count uniq files:"; find ./"$f" -mindepth 1 -type f -exec sha1sum {} \; | sort | awk '{print $1}'| uniq | wc -l; echo -e "\n" ;done; done
