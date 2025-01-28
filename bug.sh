#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file named 'count.txt' and initialize it to 0.
echo 0 > count.txt

# Function to increment the counter.
increment_counter() {
  local current_count=$(cat count.txt)
  local new_count=$((current_count + 1))
echo $new_count > count.txt
}

# Run the increment_counter function concurrently in two processes.
increment_counter &
increment_counter &

# Wait for both processes to finish.
wait

# Print the final count.
echo "Final count: $(cat count.txt)"