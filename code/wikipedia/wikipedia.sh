#!/bin/bash

echo "Wikipedia exercice: "

# Get wikipedia page
curl https://www.wikipedia.org/ > page.txt

# Loop
for i in {1..10}
do
    grep -Eoi '<a [^>]+>' page.txt |
    grep -Eo 'href="[^"]+"' |
    grep -Eo '(http|https)://[^/"]+' > links.txt

    shuf="shuf -n 1 links.txt"
    nextLink=$(eval "$shuf")
    echo $nextLink
    echLink="echo $nextLink"
    curl -e $echLink > page.txt
done

echo "Program done"