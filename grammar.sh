#!/bin/bash

# Array to hold challenge questions
questions=(
    "Do not write the letter ы after Г, К, Х, Ж, Ч, Ш, Щ instead use:"
    "Do not write an unstressed о after Ж, Ч, Ш, Щ, Ц instead use:"
    "Do not write the letter я after Г, К, Х, Ж, Ч, Ш, Щ, Ц instead use:"
    "Do not write the letter ю after Г, К, Х, Ж, Ч, Ш, Щ, Ц instead use:"
    "Gender (last letter of the word): When it is a consonant or й, the word is:"
    "Gender (last letter of the word): When it is а or я it is:"
    "Gender (last letter of the word): When it is о or е it is:"
    "Gender (last letter of the word): When it is a soft sign ь then it could be either:"
    "For masculine nouns (object of a sentence), when it is inanimate, there is:"
    "For masculine nouns (object of a sentence), when it is animate and ends in a consonant, add:"
    "For masculine nouns (object of a sentence), when it is animate, replace й with:"
    "For masculine nouns (object of a sentence), when it is animate, replace ь with:"
    "For feminine nouns (object of a sentence), replace а with:"
    "For feminine nouns (object of a sentence), replace я with:"
    "For feminine nouns (object of a sentence), it __ change when it is a soft sign:"
    "For neuter nouns (object of a sentence), inanimate nouns do not change because almost all neuter nouns are:"
    "For masculine nouns (how is something done), all consonants, add:"
    "For masculine nouns (how is something done), if the noun ends in unstressed ж, ц, ч, ш or щ, then add:"
    "For masculine nouns (how is something done), replace й with __ if stressed ём:"
    "For masculine nouns (how is something done), replace ь with __ if stressed ём:"
    "For feminine nouns, replace а with:"
    "For feminine nouns, when the stem of the noun ends in ж, ц, ч, ш or щ, replace а with:"
    "For feminine nouns, replace я with __ if stressed ёй:"
    "For feminine nouns, replace ь with:"
    "For neuter nouns, add:"
    "For masculine nouns (plural - add и, ы, я, or а), when the word ends in a consonant, add:"
    "For masculine nouns (plural - add и, ы, я, or а), replace й with:"
    "For masculine nouns (plural - add и, ы, я, or а), replace ь with:"
    "For feminine nouns (plural - add и, ы, я, or а), replace я with:"
    "For feminine nouns (plural - add и, ы, я, or а), replace ь with:"
    "For feminine nouns (plural - add и, ы, я, or а), replace а with:"
    "For neuter nouns (plural - add и, ы, я, or а), replace о with:"
    "For neuter nouns (plural - add и, ы, я, or а), replace е with:"
    "For reflexive verbs, conjugate the verb normally then add сь when the verb ends in a vowel:"
    "For reflexive verbs, conjugate the verb normally then add ся when it does not end in a vowel:"
)

# Array to hold correct answers
answers=(
    "и"
    "е"
    "а"
    "у"
    "masculine"
    "feminine"
    "neuter"
    "masculine or feminine"
    "no change"
    "а"
    "я"
    "я"
    "у"
    "ю"
    "does not"
    "no change"
    "ом"
    "ем"
    "ем"
    "ем"
    "ой"
    "ей"
    "ей"
    "ью"
    "м"
    "ы"
    "и"
    "и"
    "и"
    "ы"
    "и"
    "а"
    "я"
    "я"
    "сь"
    "ся"
)

# Function to generate a random number within range
function generate_random() {
    echo $((RANDOM % $1))
}

# Variables to track last question index
last_question_index=-1
current_question_index=-1

# Function to get a random question index that is not the same as the last one
function get_random_question_index() {
    while true; do
        current_question_index=$(generate_random ${#questions[@]})
        if [ "$current_question_index" != "$last_question_index" ]; then
            last_question_index=$current_question_index
            break
        fi
    done
}

# Function to display a question and prompt for user input
function display_question() {
    get_random_question_index
    echo -n "${questions[$current_question_index]} "
    read -r response
    response=$(echo "$response" | tr -d '[:space:]') # Remove spaces
    if [ "${response,,}" == "q" ] || [ "${response,,}" == "quit" ] || [ "${response,,}" == "exit" ]; then
        exit
    fi
    if [ "${response,,}" == "${answers[$current_question_index]}" ]; then
        echo "Correct!"
    else
        echo "Incorrect: ${answers[$current_question_index]}"
    fi
    sleep 3
    clear
}

# Main loop
while true; do
    display_question
done  
