# Shell script: Check whether a given file is a directory or regular file

echo "Enter a file/folder name:"
read path
if [ -d "$path" ]; then
    echo "It is a directory."
elif [ -f "$path" ]; then
    echo "It is a regular file."
else
    echo "Does not exist."
fi