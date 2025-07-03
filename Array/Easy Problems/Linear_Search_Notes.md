
# 🔍 Linear Search

## 📌 Problem Statement

Given an array `a` and an integer `x`, find the index of the first occurrence of `x` in the array.  
If `x` is not found, return `-1`.

---

## 💡 Approach: Linear Search

### 🔸 Logic

- Traverse the array from the beginning.
- Compare each element with `x`.
- If found, return the index.
- If the loop finishes and no match is found, return `-1`.

### 📦 Time Complexity

- **Best Case:** `O(1)` — `x` is at the beginning.
- **Worst Case:** `O(n)` — `x` is at the end or not present.

### 🧠 Space Complexity

- **O(1)** — constant space used.

---

## ✅ Code

```cpp
#include <bits/stdc++.h> 
using namespace std;

int linearSearch(vector<int> &a, int x) {
    int id = -1;
    for(int i = 0; i < a.size(); i++) {
        if(a[i] == x) {
            id = i;
            break;
        }
    }
    return id;
}
```

---

## 🧪 Example

```cpp
Input: a = [10, 20, 30, 40, 50], x = 30  
Output: 2

Input: a = [1, 2, 3, 4], x = 5  
Output: -1
```

---

## 📝 Summary

| Property         | Value                  |
|------------------|------------------------|
| Time Complexity  | O(n)                   |
| Space Complexity | O(1)                   |
| Stable           | Yes                    |
| Use Case         | Unsorted/small arrays  |

---
