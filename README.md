# bec51306_coding_assignment
# Q1: Selecting lines from stdin (Python Code + Linux Command)
  This Python code reads data from stdin, checks each line for the provided pattern, and writes any matching lines to an output file.
  The script reads input line by line from stdin. It then checks whether the line matches any of the specified patterns. 
  If a match is found, the line is written to an output file called *matched.tsv*.
  ```bash
  zcat data/q1_data.tsv.gz | awk 'NR==1||/ENSG/'  | python assignment1.py data/to_select.tsv  > matched.tsv
 ```

# Q2: Plotting a group of lines (R + Linux Command)
  The R script will generate line plots based on different clusters which is represented by different colours. It will read the data from stdin and use ggplot to create the visualizations.
  ```bash
cat data/q2_data.tsv | Rscript question2.R "outputs/different_clusters.png" "Relative from center [bp]" "Enrichment over Mean" "MNase fragment profile"
  ```
# Q3 Merge multiple files (R + Linux Command)  
  The code reads all the input files and perform an inner join based on the first column, which is the primary key for the join operation. 
  The names of the other columns are random, but the first column contains the same data in both the files, so it acts as a key. Hence we labeled it as "key" to facilitate the join process. 
  Since we are performing an inner join, the output will contain the corresponding keys value along with other columns. It is required that each input file has the key as the first column, otherwise the inner join will be unsuccessful.
  ```bash
  Rscript join_list_of_files.R data/list_q3.tsv  > data/join_output.tsv
  ```
