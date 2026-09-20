#!/bin/bash

#1. SAVE THE FIRST ARGUMENT INTO A BOX WITH A CLEAR NAME

TARGET_FILE="$1"

#2. ANSWER FIRST QUESTION OF GAURD 1: DID THEY FORGET TO GIVE US A FILE NAME

if [[ -z "$TARGET_FILE" ]]; then
    
    echo "usage: mini_scan.sh <filename>"
    exit 1

fi

#3. ANSWER SECOND QUESTION DOES THE FILE EVEN EXIST

if [[ ! -f "$TARGET_FILE" ]]; then

    echo "Error I cannot find the file specified '$TARGET_FILE'"
    exit 1


fi


#4. ANSWER THE THIRD QUESTION FIND THE SUSPICIOUS WORDS USING WHILE LOOP

    echo "===Starting scan on $TARGET_FILE ==="

#5. SO ONCE THE LINE PRINTS THE SECOND STEP WOULD BE TO WRITE THE WHILE LOOP

    while read -r WORD; do

    echo "Checking for the word: '$WORD'..."

    # WE USE GREP -IN TO FIND THE SUSPICIOUS WORDS AND WE USE THE - IN TO IGNORE UPPERCASE AND LOWERCASE AND TO SHOW LINE NUMBERS

    matches=$(grep -inE "$WORD" "$TARGET_FILE")

if [[ -n "$matches" ]]; then

    echo "$matches"
 
    line_count=$(echo "$matches" | wc -l)
 
    match_count=$((match_count + line_count))
fi

    echo "Total suspicious lines found: $match_count"

    echo "_____________________________________________"

done < patterns.txt

echo "====scan complete====" 
