#!/usr/bin/env python3

import sys
import os


def print_help():
    print("Argument must be of type .md\nUsage:\n\tmd2pdf file.md\n")


def main():
    # if only 0 arguments are given to script
    if len(sys.argv) == 1:
        print("Error: missing required argument.")
        print_help()
        return
    # if the first argument doesn't end with .md
    elif not sys.argv[1].endswith(".md"):
        print('Error: argument must be a file of type markdown and end with ".md"')
        print_help()
        return

    # open markdown file given as argument
    input_file = open(sys.argv[1], 'r')

    # remove trailing spaces and line breaks from each libe
    lines = (line.rstrip() for line in input_file)

    # remove empty lines
    lines = [line for line in input_file if line]

    # get the line from markdown file with the folders path
    folder_line = lines[4].rstrip()

    # get only the path from the folders line
    folders = folder_line.split(":")[1]

    # if the folders line in meta data is empty
    if folders == "" or folders == None or folders == " ":
        print("Error: no folder specified in meta data.")
        return

    # remove quotes from string
    folder = folders.strip().replace('"', '')

    # store the path of the pdfs folder
    path = '/home/dandan/vimwiki/PDFs'

    # get only the file name without extension
    base = sys.argv[1].replace('.md', '')

    # open pdf file in the path specified in the folders line in the markdown file
    os.system("xdg-open " + path + "/" + folder + "/" + base + ".pdf")


if __name__ == "__main__":
    main()
