
# 🌀 Rotate Image (90 Degrees Clockwise) - In-Place

## 🔸 Problem Statement
You are given an `n x n` 2D matrix representing an image.  
**Rotate the image by 90 degrees (clockwise)** in-place.

### Input:
```cpp
vector<vector<int>> matrix = {
  {1, 2, 3},
  {4, 5, 6},
  {7, 8, 9}
};
```

### Output after rotation:
```cpp
{
  {7, 4, 1},
  {8, 5, 2},
  {9, 6, 3}
}
```

---

## ✅ Optimal Approach: Transpose + Reverse

### 🔍 Intuition:
To rotate the matrix clockwise:

1. **Transpose the matrix** – convert rows to columns.
2. **Reverse each row** – to get the correct order of rotated columns.

---

## 🧠 Logic & Step-by-Step Explanation

### 🔹 Step 1: Transpose the Matrix
Swap `matrix[i][j]` with `matrix[j][i]` only when `j > i`.

```cpp
for(int i = 0; i < n-1; i++){
    for(int j = i+1; j < n; j++){
        swap(matrix[i][j], matrix[j][i]);
    }
}
```

### 🔹 Step 2: Reverse Each Row
Now, for each row, reverse the elements.

```cpp
for(int i = 0; i < n; i++){
    reverse(matrix[i].begin(), matrix[i].end());
}
```

---

## 📊 Dry Run (Visual Explanation)

### Original Matrix:
```
[ [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9] ]
```

### Step 1: Transpose (convert rows to columns)
Swap `matrix[i][j]` and `matrix[j][i]` for `j > i`:
```
[ [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9] ]
```

### Step 2: Reverse each row
```
[ [7, 4, 1],
  [8, 5, 2],
  [9, 6, 3] ]
```

✅ **Matrix successfully rotated 90° clockwise**

---

## 💡 Code

```cpp
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();

        // Step 1: Transpose
        for(int i = 0; i < n-1; i++) {
            for(int j = i+1; j < n; j++) {
                swap(matrix[i][j], matrix[j][i]);
            }
        }

        // Step 2: Reverse each row
        for(int i = 0; i < n; i++) {
            reverse(matrix[i].begin(), matrix[i].end());
        }
    }
};
```

---

## 🧮 Time & Space Complexity

| Operation        | Complexity |
|------------------|------------|
| Time Complexity   | `O(n²)`    |
| Space Complexity  | `O(1)` (in-place) |

---

## 📝 Notes
- This is an **in-place rotation** — no extra matrix is used.
- This approach works **only for square matrices** (`n x n`).
- **Transpose + Reverse** is the most efficient and readable way to do this.

---

## 📌 Follow-Up (For Interviews)
What if you had to rotate it **anti-clockwise**?
> **Answer**: First **reverse each row**, then **transpose**.
