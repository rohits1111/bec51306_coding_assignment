import sys
import pandas as pd

# Read numbers from stdin
numbers = [int(line.strip()) for line in sys.stdin]

# Get the number of quantiles from command-line arguments
num_quantiles = int(sys.argv[1])

# Calculate quantiles with labels and intervals
quantiles = pd.qcut(numbers, num_quantiles, labels=[f'q{i+1}' for i in range(num_quantiles)])
intervals = pd.qcut(numbers, num_quantiles)
# Print each number with its quantile label and interval range
for number, quantile, interval in zip(numbers, quantiles, intervals):
    print(f'{number}\t{quantile}\t{interval}')

