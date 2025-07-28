
# Zero Matrix Problem - Brute Force, Better, and Optimal Approaches

## 🧠 Problem Statement
Given an `n x m` matrix. If any cell of the matrix contains 0, set its entire row and column to 0.

### 🔢 Example
```
Input:
Matrix =
[
  [1, 2, 3],
  [4, 0, 6],
  [7, 8, 9]
]

Output:
[
  [1, 0, 3],
  [0, 0, 0],
  [7, 0, 9]
]
```

---

## 🔨 Brute Force Approach
### ✅ Logic
If a cell contains 0, mark its entire row and column with a temporary marker (e.g., -1) instead of immediately setting it to 0. After scanning all elements, replace all `-1` with 0.

### 💡 Explanation
- Traverse each cell in the matrix.
- When you find a 0, mark the entire row and column with -1 (but avoid overwriting existing 0s).
- Finally, replace all -1s with 0.

### 📘 Code
```cpp
class Solution {
public:
    void markRow(int i, vector<vector<int>>& matrix) {
        for (int j = 0; j < matrix[i].size(); j++) {
            if (matrix[i][j] != 0) {
                matrix[i][j] = -1;
            }
        }
    }

    void markCol(int j, vector<vector<int>>& matrix) {
        for (int i = 0; i < matrix.size(); i++) {
            if (matrix[i][j] != 0) {
                matrix[i][j] = -1;
            }
        }
    }

    void setZeroes(vector<vector<int>>& matrix) {
        for (int i = 0; i < matrix.size(); i++) {
            for (int j = 0; j < matrix[i].size(); j++) {
                if (matrix[i][j] == 0) {
                    markRow(i, matrix);
                    markCol(j, matrix);
                }
            }
        }
        for (int i = 0; i < matrix.size(); i++) {
            for (int j = 0; j < matrix[i].size(); j++) {
                if (matrix[i][j] == -1) {
                    matrix[i][j] = 0;
                }
            }
        }
    }
};
```

### ⏱️ Time Complexity: O(n * m * (n + m))
### 🗂️ Space Complexity: O(1) but modifying input destructively

---

## ⚙️ Better Approach
### ✅ Logic
Use two arrays: one to keep track of rows and one for columns that should be set to zero.

### 💡 Explanation
- Traverse matrix and record rows and columns having at least one 0.
- Traverse matrix again and update cells based on recorded rows and columns.

### 📘 Code
```cpp
vector<vector<int>> zeroMatrix(vector<vector<int>> &matrix, int n, int m) {
    int row[n] = {0};
    int col[m] = {0};

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (matrix[i][j] == 0) {
                row[i] = 1;
                col[j] = 1;
            }
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (row[i] == 1 || col[j] == 1) {
                matrix[i][j] = 0;
            }
        }
    }
    return matrix;
}
```

### ⏱️ Time Complexity: O(n * m)
### 🗂️ Space Complexity: O(n + m)

---

## 🚀 Optimal Approach
### ✅ Logic
Use first row and first column of the matrix itself to store information instead of using extra space. Also, use an extra variable `col0` to track if first column needs to be zeroed.

### 💡 Explanation
- First pass: mark zeros in the first row and first column.
- Second pass: use this info to set appropriate cells to 0.
- Final pass: set first row and column to 0 if needed.

### 📘 Code
```cpp
vector<vector<int>> zeroMatrix(vector<vector<int>> &matrix, int n, int m) {
    int col0 = 1;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (matrix[i][j] == 0) {
                matrix[i][0] = 0;
                if (j != 0)
                    matrix[0][j] = 0;
                else
                    col0 = 0;
            }
        }
    }

    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            if (matrix[0][j] == 0 || matrix[i][0] == 0) {
                matrix[i][j] = 0;
            }
        }
    }

    if (matrix[0][0] == 0) {
        for (int j = 0; j < m; j++) {
            matrix[0][j] = 0;
        }
    }

    if (col0 == 0) {
        for (int i = 0; i < n; i++) {
            matrix[i][0] = 0;
        }
    }

    return matrix;
}
```

### ⏱️ Time Complexity: O(n * m)
### 🗂️ Space Complexity: O(1)

---

## 📊 Visual Representation
### Example Matrix:
```
Initial Matrix:
[
  [1, 2, 3],
  [4, 0, 6],
  [7, 8, 9]
]

Brute Force After Marking:
[
  [1, -1, 3],
  [-1, 0, -1],
  [7, -1, 9]
]

After Final Step:
[
  [1, 0, 3],
  [0, 0, 0],
  [7, 0, 9]
]

Better/Optimal Final Matrix:
[
  [1, 0, 3],
  [0, 0, 0],
  [7, 0, 9]
]
```

---

## ✅ Summary
| Approach      | Time Complexity | Space Complexity | Extra Notes |
|---------------|------------------|-------------------|--------------|
| Brute Force   | O(N*M*(N+M))     | O(1) (modifies in-place with temp -1) | Inefficient for large matrices |
| Better        | O(N*M)           | O(N + M)          | Cleaner and faster |
| Optimal       | O(N*M)           | O(1)              | Best solution for constraints |

---

Happy Coding! 🚀
