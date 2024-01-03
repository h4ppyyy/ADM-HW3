#!/bin/bash


# Merge all course files in the current folder
awk 'NR==1{print; next} FNR>1' course_*.tsv > merged_courses.tsv

# Check if any files were found and merged
if [ -s merged_courses.tsv ]; then
    echo "Files merged successfully."

    # Which country offers the most Master's Degrees?
    echo "Which country offers the most Master's Degrees?"
    cut -f11 merged_courses.tsv | sort | uniq -c | sort -nr | awk '{print $2, $3}' | head -n 1

    # Which city?
    echo "Which city offers the most Master's Degrees?"
    cut -f10 merged_courses.tsv | sort | uniq -c | sort -nr | awk '{print $2}' | head -n 1

    # How many colleges offer Part-Time education?
    echo "How many colleges offer Part-Time education?"
    awk -F'\t' '$4 ~ /Part[ -]Time/i {count++} END {print count}' merged_courses.tsv

    # Print the percentage of courses in Engineering
    echo "Print the percentage of courses in Engineering"
    total_lines=$(wc -l < merged_courses.tsv)
    engineer_lines=$(grep -i 'Engineer' merged_courses.tsv | wc -l)
    engineer_percentage=$(awk "BEGIN {print ($engineer_lines / ($total_lines - 1)) * 100}")
    echo "$engineer_percentage%"
else
    echo "No matching files found in the current folder."
fi
