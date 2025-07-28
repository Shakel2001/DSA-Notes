
# 🟩 Pascal's Triangle – Print a Specific Row

---

## ✅ Problem Statement

Given a row number `r`, print the entire row of Pascal's Triangle.  
Pascal's Triangle starts from row 1 as:  
```
Row 1:         1  
Row 2:       1   1  
Row 3:     1   2   1  
Row 4:   1   3   3   1  
Row 5: 1   4   6   4   1  
```

---

## 🧠 Brute Force Approach (Using nCr Formula)

### 🔸 Logic:
To get the value at column `c` in row `r`, use:
```
nCr(r - 1, c - 1)
```
We loop through all columns of the given row and compute nCr for each.

### 🔹 Code:
```cpp
#include<bits/stdc++.h>
using namespace std;

int NcR(int n, int r){
    long long res = 1;
    for(int i = 0; i < r; i++){
        res = res * (n - i);
        res = res / (i + 1);
    }
    return res;
}

void printPasscalRow(int row){
    for(int i = 1; i <= row; i++){
        cout << NcR(row - 1, i - 1) << " ";
    }
}

int main(){
    int row;
    cin >> row;
    printPasscalRow(row);
}
```

### ✅ Time Complexity:
- **O(r × r)** — Each nCr takes O(r) time for multiplication and division.

### ✅ Space Complexity:
- **O(1)** — Constant extra space.

---

## 🧠 Optimal Approach (Iterative nCr Build)

### 🔸 Logic:
Instead of recomputing factorial or nCr from scratch, we build values using:
```
C(i) = C(i-1) × (row - i) / i
```
This avoids repetitive calculations and is much faster.

### 🔹 Code:
```cpp
#include<bits/stdc++.h>
using namespace std;

void printPasscalRow(int row){
    int ans = 1;
    cout << ans << " ";
    for(int i = 1; i < row; i++){
        ans = ans * (row - i);
        ans = ans / i;
        cout << ans << " ";
    }
}

int main(){
    int row;
    cin >> row;
    printPasscalRow(row);
}
```

### ✅ Time Complexity:
- **O(r)** — Efficient single loop computation.

### ✅ Space Complexity:
- **O(1)** — No extra space used.

---

## 🔍 Visual Example (Row 5):

**Output:**
```
1 4 6 4 1
```

**How:**
```
C(0) = 1  
C(1) = 4  
C(2) = 6  
C(3) = 4  
C(4) = 1
```

---

## 🏁 Summary

| Approach     | Time Complexity | Space Complexity | Remarks                  |
|--------------|------------------|-------------------|---------------------------|
| Brute Force  | O(r × r)         | O(1)              | Uses nCr formula repeatedly |
| Optimal      | O(r)             | O(1)              | Builds values iteratively |

---
