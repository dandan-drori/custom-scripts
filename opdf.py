#!/usr/bin/env python3

import sys
import os


def print_help():
    print("Required arguments: 1\n")
    print("Argument must be of type .md\n")
    print("Usage:\n")
    print("     opdf file.md\n")


def main():
    # if only 0 arguments are given to script
    if len(sys.argv) == 1:
        print("Error: missing required argument.\n")
        print_help()
        sys.exit()
    # if the first argument doesn't end with .md
    elif not sys.argv[1].endswith(".md"):
        print('Error: argument must be a file of type markdown and end with ".md"\n')
        print_help()
        sys.exit()

    input_file = open(sys.argv[1], 'r')
    lines = (line.rstrip() for line in input_file)
    lines = [line for line in input_file if line]
    folder_line = lines[4].rstrip()
    folders = folder_line.split(":")[1]

    # if the folders line in meta data is empty
    if folders == "" or folders == None or folders == " ":
        print("Error: no folder specified in meta data.")
        sys.exit()

    # remove quotes from string
    folder = folders.strip().replace('"', '')

    # store the path of the pdfs folder
    path = '/home/dandan/vimwiki/PDFs'

    # execute the conversion script
    base = sys.argv[1].replace('.md', '')
    os.system("xdg-open " + path + "/" + folder + "/" + base + ".pdf")


if __name__ == "__main__":
    main()
