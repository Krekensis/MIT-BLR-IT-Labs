# Shell script: Replace “ex:” → “Example:” only if it occurs at start of line OR after a period “.”

for f in *
do
    if [ -f "$f" ]; then
        sed -i 's/^ex:/Example:/g; s/\. ex:/\. Example:/g' "$f"
    fi
done

echo "Replacement done in current folder files."