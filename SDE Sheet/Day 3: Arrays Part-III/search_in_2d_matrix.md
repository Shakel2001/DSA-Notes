
# 🔍 Search in a 2D Matrix

## 🧩 Problem Statement
You are given a 2D matrix where:
- Each row is sorted in **ascending** order.
- The **first integer** of each row is greater than the **last integer** of the previous row.

Determine if a given target value exists in the matrix.

---

## ✅ Brute Force Approach

```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        for(int i = 0; i < matrix.size(); i++) {
            for(int j = 0; j < matrix[i].size(); j++) {
                if(matrix[i][j] == target) {
                    return true;
                }
            }
        }
        return false;
    }
};
```

### 🔍 Logic:
Loop through each element of the matrix and check if it matches the target.

### ⏱️ Time Complexity:
- **O(n * m)** where `n` is the number of rows and `m` is the number of columns.

### 📦 Space Complexity:
- **O(1)** — No extra space used.

---

## ⚡ Optimal Approach 1: Row-wise Filtering + Linear Search

```cpp
class Solution {
public:
    bool BS(vector<int> matrix, int target){
        for(int i = 0; i < matrix.size(); i++) {
            if(matrix[i] == target) {
                return true;
            }
        }
        return false;
    }

    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        for(int i = 0; i < matrix.size(); i++) {
            if(matrix[i][0] <= target && matrix[i].back() >= target) {
                return BS(matrix[i], target);
            }
        }
        return false;
    }
};
```

### 🔍 Logic:
- Traverse each row and check if the target can exist in that row (by comparing with the first and last elements).
- If yes, perform linear search on that row.

### ⏱️ Time Complexity:
- Worst Case: **O(n + m)**

### 📦 Space Complexity:
- **O(1)**

---

## 💎 Optimal Approach 2: Treat Matrix as 1D Array + Binary Search

```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int n = matrix.size();
        int m = matrix[0].size();
        int low = 0, high = n * m - 1;

        while(low <= high) {
            int mid = (low + high) / 2;
            int row = mid / m;
            int col = mid % m;

            if(matrix[row][col] == target) {
                return true;
            } else if(matrix[row][col] < target) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return false;
    }
};
```

### 🔍 Logic:
- Convert the 2D matrix into a virtual 1D array.
- Apply Binary Search on the index.
- Convert the 1D index to 2D using:
  - `row = mid / cols`
  - `col = mid % cols`

### ⏱️ Time Complexity:
- **O(log(n * m))**

### 📦 Space Complexity:
- **O(1)**

---

## 🔚 Conclusion

| Approach           | Time Complexity | Space Complexity | Technique                 |
|-------------------|------------------|-------------------|---------------------------|
| Brute Force        | O(n × m)         | O(1)              | Nested Loops             |
| Optimal 1          | O(n + m)         | O(1)              | Row Filtering + Search   |
| Optimal 2 ✅ Best   | O(log(n × m))    | O(1)              | Binary Search on Matrix  |

✅ **Use Optimal 2 for the best performance on large datasets.**
