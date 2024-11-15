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
# Q4: Label with quantiles (Python)
  Imported the sys module, which allows the script to read input from standard input (stdin) and access command-line arguments. Imported the pandas library, which provides powerful data manipulation and analysis functions, including the qcut function used   here for quantile calculations. The script reads numbers from standard input. It calculates the quantiles, assigning each number a quantile label and an interval.It then prints each number, its quantile label, and the interval range in a formatted     manner.
```bash
  cat data/first_hundred_numbers.tsv | python group_in_quantiles.py 4 > output_q4_2.tsv
```
# Q5: Plotting big matrix (Linux + Gnuplot)
  **Download the Data**
    ```bash
    curl -JLO https://figshare.com/ndownloader/files/49000657?private_link=9f1324117c2f6e734f2b -O big_data.tsv.gz
    ```
  **Getting the matrix which will be used for GNUplot**
      Here we remove the first column since it is a string.
      ```bash
      awk '{ $1=""; print $0 }' big.tsv
      ```
  **Install and Run GNUPLOT**
  ```bash
    sudo apt install gnuplot
    gnuplot heatmap.gp
  ```
  **Installing Ghostscript to use ps2pdf and converting eps to pdf and opening pdf to get the heatmap**
  ```bash
    sudo apt install ghostscript
    ps2pdf optimised_matrix.eps
    xdg-open optimised_matrix.pdf

      
