def is_safe(board, row, col):
    """ Check if it's safe to place a queen at board[row][col] """
    
    # Check columns in previous rows
    for r in range(row):
        if board[r] == col or abs(board[r] - col) == abs(r - row):
            return False
    return True

def solve_queens(board, row, n, solutions):
    """ Recursive function to solve the 8-Queens problem """
    
    if row == n:
        # Found a solution
        solutions.append(board[:])  # Make a copy of the board
        return
    
    for col in range(n):
        if is_safe(board, row, col):
            board[row] = col  # Place queen at board[row][col]
            solve_queens(board, row + 1, n, solutions)
            # Backtrack
            board[row] = -1

def solve_n_queens(n):
    """ Function to initialize solving of the 8-Queens problem """
    
    board = [-1] * n  # Initialize empty board, -1 means no queen is placed in that row
    solutions = []
    solve_queens(board, 0, n, solutions)
    return solutions

def print_board(board):
    """ Helper function to print a board """
    
    n = len(board)
    for row in range(n):
        line = ""
        for col in range(n):
            if board[row] == col:
                line += "Q "
            else:
                line += ". "
        print(line)
    print()

# Solve and print all solutions for 8-Queens
n = 8
solutions = solve_n_queens(n)
print(f"Found {len(solutions)} solutions for {n}-Queens problem:\n")
for i, solution in enumerate(solutions, 1):
    print(f"Solution {i}:")
    print_board(solution)
