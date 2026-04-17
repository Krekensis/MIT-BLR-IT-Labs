# Shell script: Replace all .txt files with .text recursively

find . -type f -name "*.txt" | while read f
do
    mv "$f" "${f%.txt}.text"
done

echo "Renamed all .txt to .text recursively."