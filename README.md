# bec51306_coding_assignment
# Q1: Selecting lines from stdin (Python Code + Linux Command)
  This Python code reads data from stdin, checks each line for the provided pattern, and writes any matching lines to an output file.
  The script reads input line by line from stdin. It then checks whether the line matches any of the specified patterns. 
  If a match is found, the line is written to an output file called *matched.tsv*.
  ```bash
  zcat data/q1_data.tsv.gz | awk 'NR==1||/ENSG/'  | python assignment1.py data/to_select.tsv  > matched.tsv

**# Q2: Plotting a group of lines (R + Linux Command)**
