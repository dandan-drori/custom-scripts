#!/usr/bin/env python3
import sys


def convert_to_snake_case(word):
    initial_index = 0
    for char in word:
        if char.upper() == char:
            index = word[initial_index:].find(char.upper())
            word = word[:index+initial_index] + \
                "_" + word[index+initial_index:]
            initial_index += index+2
    return word.upper()


def convert_to_camel_case(words):
    new_word = ""
    for word in words:
        word = word.lower()
        if not word == words[0].lower():
            word = word[:1].upper() + word[1:]
        new_word += word
    return new_word


def main():
    word = sys.argv[1]
    words = word.split('_')
    if words[0] == word and words[0].upper() == word or words[0] != word:
        print(convert_to_camel_case(words))
        return
    elif words[0] == word:
        print(convert_to_snake_case(word))
        return


if __name__ == "__main__":
    main()
