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
        sys.exit()
    # if the first argument doesn't end with .md
    elif not sys.argv[1].endswith(".md"):
        print('Error: argument must be a file of type markdown and end with ".md"')
        print_help()
        sys.exit()

    # open .md file
    input_file = open(sys.argv[1], 'r')

    # strip trailing spaces and line breaks from each line
    lines = (line.rstrip() for line in input_file)

    # skip empty lines in lines
    lines = [line for line in input_file if line]

    # get the line with the folders from file
    folder_line = lines[4].rstrip()

    # get only the folders path
    folders = folder_line.split(":")[1]

    # remove quotes from folders string
    folder = folders.strip().replace('"', '')

    # if the folders line in meta data is empty
    if folder == "" or folder == None or folder == " ":
        print("Error: no folder specified in meta data.")
        return

    # store path of PDFs directory
    path = '/home/dandan/vimwiki/PDFs'

    # get number of subfolders
    num_of_subfolders = len(folder.split("/"))

    # if folders in meta data is "folder" and not "folder/subfolder"
    if num_of_subfolders == 1:
        # make a directory
        if not os.path.exists(path + "/" + folder):
            os.system("mkdir " + path + "/" + folder + "/")

    # store the first folder without the subfolders
    changing_path = folder.split("/")[0]

    # for each subfolder
    for i in range(num_of_subfolders):
        # if it's the first folder
        if i == 0:
            # make directory with that name
            if not os.path.exists(path + "/" + folder.split("/")[0]):
                os.system("mkdir " + path + "/" + folder.split("/")[0] + "/")
        # if it's not the first folder
        else:
            # add current folder to changing path
            changing_path += "/" + folder.split("/")[i]
            # create sub directory inside directory using changing_path
            if not os.path.exists(path + "/" + changing_path):
                os.system("mkdir " + path + "/" + changing_path)

    # get the base of the file without extension
    base = sys.argv[1].replace('.md', '')

    # create pdf file in the same directory
    os.system("pandoc " + sys.argv[1] + " -o " +
              base + ".pdf")

    # move pdf file to the correct directory
    os.system("mv " + base + ".pdf " + path + "/" + folder + "/")


if __name__ == "__main__":
    main()
