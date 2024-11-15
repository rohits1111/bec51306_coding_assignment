import sys
import pandas as pd


select = list(pd.read_csv(sys.argv[1], sep="\t", header = None)[0])


for line in sys.stdin:
    for item in select:
        if item in line:
            print(line)


