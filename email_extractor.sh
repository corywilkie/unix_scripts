perl -wne'while(/[\w\.\-]+@[\w\.\-]+\w+/g){print "$&\n"}' emails.txt | sort -u > output.txt
