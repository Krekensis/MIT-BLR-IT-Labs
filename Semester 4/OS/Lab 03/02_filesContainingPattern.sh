# Shell script: List all files (only file names) containing input pattern in a given folder

echo "Enter folder path:"
read folder

echo "Enter pattern (string):"
read pattern

grep -rl "$pattern" "$folder" 2>/dev/null | xargs -n 1 basename