# Shell script: Copy files (single level only) with input extension to a new folder

echo "Enter file extension (example: .text):"
read ext

echo "Enter destination folder name:"
read dest

mkdir -p "$dest"
for f in *"$ext"
do
    if [ -f "$f" ]; then
        cp "$f" "$dest"
    fi
done
echo "Copied matching files to $dest."