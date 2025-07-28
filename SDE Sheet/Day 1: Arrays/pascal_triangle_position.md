
# Pascal's Triangle: Find Element at Given Row and Column

## 🧠 Problem Statement
Given a position in Pascal's Triangle (row, col), find the value at that position.

### 📌 Note:
- Formula = {row-1}c{col-1} NcR
- Pascal’s Triangle indexing starts from **row = 1** and **col = 1** (1-based indexing).
- Each value at position (r, c) is given by **nCr**:
\[
P(r, c) = \binom{r-1}{c-1}
\]

---

## ✅ Efficient Code

```cpp
#include <bits/stdc++.h>
using namespace std;

// Function to compute nCr
int NcR(int n, int r) {
    long long res = 1;
    for (int i = 0; i < r; i++) {
        res = res * (n - i);
        res = res / (i + 1);
    }
    return res;
}

// Function to find element at a given position in Pascal's Triangle
void findPascialTrianglePossition(int row, int col) {
    cout << NcR(row - 1, col - 1);
}

int main() {
    int row;
    int col;
    cin >> row;
    cin >> col;
    findPascialTrianglePossition(row, col);
}
```

---

## 💡 Logic

To find the value at **row R** and **column C** in Pascal’s Triangle:

\[
P(R, C) = \binom{R-1}{C-1}
\]

Because Pascal Triangle starts from row 1, col 1, but in combinatorics:
\[
\binom{n}{r} = \binom{R-1}{C-1}
\]

---

## 📊 Example

### Input:
```
row = 5
col = 3
```

### Output:
```
6
```

### Explanation:
\[
\binom{4}{2} = 6
\]

---

## ⚙️ Time and Space Complexity

| Metric           | Value |
|------------------|-------|
| Time Complexity  | O(col) |
| Space Complexity | O(1)   |

---

## ✅ Summary

You can directly find any element in Pascal’s Triangle using the nCr formula:
\[
\binom{row - 1}{col - 1}
\]

This is very useful for combinatorics and Pascal-related problems in interviews and competitive programming.

Happy Coding! 🎯
