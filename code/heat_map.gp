set terminal postscript eps size 6,10 font 'Arial, 12'
set output "optimized_matrix.eps"

# Set the color palette
set palette model RGB defined ( 0 'white', 0.25 'red', 0.5 'grey', 0.75 'yellow', 1 'green' )



# Remove the grid and set labels for better appearance
unset grid
unset colorbox
set border linewidth 1.5

# Plot as a heatmap with square cells
set view map
set size ratio -0.05
plot "demo3.tsv" matrix with image
