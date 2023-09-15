awk -F "|" 'BEGIN { print "col1 - col2 - col3" }; { sum += $3; print $1" - "$2" - "$3 }; END { printf "%d\n", sum }' data.txt
