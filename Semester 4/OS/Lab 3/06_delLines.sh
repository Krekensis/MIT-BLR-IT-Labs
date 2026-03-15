# Shell script: Delete all even numbered lines in a text file

echo "Enter filename:"
read file

if [ ! -f "$file" ]; then
    echo "File not found."
    exit 1
fi

sed -i '2~2d' "$file"

echo "Even numbered lines deleted."