import heapq
import itertools

class PuzzleState:
    def __init__(self, board):
        self.board = board
        self.size = len(board)
        self.blank = self.find_blank()
        self.cost = 0
        self.parent = None
        self.moves = 0

    def __lt__(self, other):
        return self.cost < other.cost

    def __eq__(self, other):
        return self.board == other.board

    def __hash__(self):
        return hash(tuple(itertools.chain(*self.board)))

    def find_blank(self):
        for i in range(self.size):
            for j in range(self.size):
                if self.board[i][j] == 0:
                    return (i, j)

    def is_goal(self):
        n = self.size
        return all(self.board[i][j] == i * n + j + 1 for i in range(n) for j in range(n - 1)) and self.board[n-1][n-1] == 0

    def get_neighbors(self):
        i, j = self.blank
        neighbors = []

        for (di, dj) in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            ni, nj = i + di, j + dj
            if 0 <= ni < self.size and 0 <= nj < self.size:
                new_board = [row[:] for row in self.board]
                new_board[i][j], new_board[ni][nj] = new_board[ni][nj], new_board[i][j]
                neighbor = PuzzleState(new_board)
                neighbor.moves = self.moves + 1
                neighbor.cost = neighbor.moves + neighbor.manhattan_distance()
                neighbor.parent = self
                neighbors.append(neighbor)

        return neighbors

    def manhattan_distance(self):
        distance = 0
        n = self.size
        for i in range(n):
            for j in range(n):
                if self.board[i][j] != 0:
                    value = self.board[i][j] - 1
                    target_row = value // n
                    target_col = value % n
                    distance += abs(i - target_row) + abs(j - target_col)
        return distance

def solve_puzzle(initial_state):
    heap = []
    initial_state.cost = initial_state.manhattan_distance()
    heapq.heappush(heap, initial_state)
    visited = set()
    visited.add(initial_state)

    while heap:
        current = heapq.heappop(heap)

        if current.is_goal():
            moves = []
            while current.parent:
                moves.append(current.board)
                current = current.parent
            moves.append(current.board)
            moves.reverse()
            return moves

        for neighbor in current.get_neighbors():
            if neighbor not in visited:
                visited.add(neighbor)
                heapq.heappush(heap, neighbor)

    return None

# Example usage:
if __name__ == "__main__":
    initial_board = [
        [1, 2, 3],
        [4, 0, 6],
        [7, 5, 8]
    ]

    initial_state = PuzzleState(initial_board)
    solution = solve_puzzle(initial_state)

    if solution:
        print("Solution found in {} moves:".format(len(solution) - 1))
        for board in solution:
            print(board)
    else:
        print("No solution found.")
