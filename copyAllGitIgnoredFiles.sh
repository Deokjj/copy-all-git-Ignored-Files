#!/bin/bash

find . -type f | git check-ignore --stdin > allGitIgnored.txt

git_ignored_files="./allGitIgnored.txt"
i=0
new_path="../copiedOnes/"

while read toCopy; do
	let "i++"
	new_path="../copiedOnes/${toCopy:2}"
	test -d "$toCopy" || mkdir -p "${new_path%/*}" && cp "$toCopy" "$new_path" && echo "$toCopy ->copied to-> $new_path."
done < $git_ignored_files

echo ""
echo "${i} files copied to ../copiedOnes/*"

rm ./allGitIgnored.txt
