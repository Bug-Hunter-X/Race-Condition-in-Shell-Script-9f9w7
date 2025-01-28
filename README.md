# Shell Script Race Condition Bug

This repository demonstrates a race condition bug in a simple shell script.  Two processes attempt to concurrently update a counter stored in a file. Due to the lack of proper synchronization, the final counter value may be less than expected (not 2).

The `bug.sh` file contains the buggy code, while `bugSolution.sh` offers a solution using file locking to prevent this race condition.

## Running the Code

1. Clone the repository.
2. Make the `bug.sh` script executable: `chmod +x bug.sh`
3. Run the buggy script: `./bug.sh`
4. Observe the unexpected final count.
5. Repeat steps 2 and 3 with `bugSolution.sh` to see the corrected output.