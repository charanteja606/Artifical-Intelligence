from collections import deque

# Define the maximum capacities of the jugs
capacity_A = 4
capacity_B = 3

# Initial state of both jugs (0, 0) means both jugs are empty
initial_state = (0, 0)

# Goal state: we want to measure exactly 2 liters
goal = 2

# Function to perform BFS to find the solution
def water_jug_bfs(capacity_A, capacity_B, goal):
    queue = deque([(0, 0, [])])  # (jug_A, jug_B, path of steps taken)
    visited = set()              # to keep track of visited states

    while queue:
        jug_A, jug_B, path = queue.popleft()

        # Check if we have reached the goal state
        if goal in (jug_A, jug_B):
            return path
        
        # Generate all possible next states
        next_states = [
            (capacity_A, jug_B, path + ["Fill jug A"]),        # Fill jug A
            (jug_A, capacity_B, path + ["Fill jug B"]),        # Fill jug B
            (0, jug_B, path + ["Empty jug A"]),                 # Empty jug A
            (jug_A, 0, path + ["Empty jug B"]),                 # Empty jug B
            (jug_A - min(jug_A, capacity_B - jug_B), jug_B + min(jug_A, capacity_B - jug_B), path + ["Pour from A to B"]),  # Pour from A to B
            (jug_A + min(jug_B, capacity_A - jug_A), jug_B - min(jug_B, capacity_A - jug_A), path + ["Pour from B to A"])   # Pour from B to A
        ]

        # Add next states to the queue if they haven't been visited
        for state in next_states:
            if (state[0], state[1]) not in visited:
                visited.add((state[0], state[1]))
                queue.append(state)

    return None  # If no solution found

# Solve the water jug problem
solution_path = water_jug_bfs(capacity_A, capacity_B, goal)

# Print the solution
if solution_path:
    print("Steps to measure 2 liters:")
    for step, step_description in enumerate(solution_path):
        print(f"Step {step + 1}: {step_description}")
else:
    print("No solution found.")

