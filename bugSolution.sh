#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create a file named 'count.txt' and initialize it to 0.
echo 0 > count.txt

# Function to increment the counter using flock for file locking.
increment_counter() {
  flock -n -x <(echo 1) # Acquire an exclusive lock on the file descriptor 
  local current_count=$(cat count.txt)
  local new_count=$((current_count + 1))
echo $new_count > count.txt
flock -u <(echo 1) # release the lock
}

# Run the increment_counter function concurrently in two processes.
increment_counter &
increment_counter &

# Wait for both processes to finish.
wait

# Print the final count.
echo "Final count: $(cat count.txt)"