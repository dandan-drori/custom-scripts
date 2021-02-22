#!/bin/bash

[[  -z $md_file_name ]] && printf "Enter markdown file name (without .md): " && read md_file_name
(
  echo "---"
  echo "title: ${md_file_name}"
  echo 'author: "Dandan Drori"'
  echo 'tags: ""'
  echo 'folder: ""'
  echo "numberSections: true"
  echo "autoEqnLabels: true"
  echo "geometry:"
  echo "- top=30mm"
  echo "- left=20mm"
  echo "- right=20mm"
  echo "- bottom=30mm"
  echo "header-includes: |"
  echo '  \usepackage{float}'
  echo '  \let\origfigure\figure'
  echo '  \let\endorigfigure\endfigure'
  echo '  \renewenvironment{figure}[1][2] {'
  echo '    \expandafter\origfigure\expandafter[H]'
  echo "  } {"
  echo '    \endorigfigure'
  echo "  }"
  echo "---"
  echo ""
  echo "# ${md_file_name}"
  echo ""
  echo "This is a template."
  echo ""
  echo "Change this text as you please."
  echo ""
  echo "## Table"
  echo "| Column 1       | Column 2     | Column 3     |"
  echo "| :------------- | :----------: | -----------: |"
  echo "|  Cell Contents | More Stuff   | And Again    |"
  echo '| You Can Also   | Put Pipes In | Like this \| |'
  echo ""
  echo "## Math"
  echo ""
  echo "> Equation:"
  echo ">"
  echo '> (1) $$c = \sqrt{a^2 + b^2}$$'
  echo ""
  echo "> Equation:"
  echo ">"
  echo '> (2) $$\lim_{n \to \infty} a_{n} = \sin (n) $$'
  echo ""
  echo "![image](../Images/31480.jpg)"
)  > ${md_file_name}.md
