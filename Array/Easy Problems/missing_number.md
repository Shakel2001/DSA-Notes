
# 🔍 Missing Number in Array

## 🧠 Problem Statement
Given an array `a` containing `n` distinct numbers taken from `1` to `n+1`, find the missing number.

---

## 📌 Example
**Input:**  
`a = {1, 2, 3, 4, 5, 7}`  
**Output:**  
`6`

---

## 🐌 Brute Force Approach

### 🔍 Logic:
- Iterate from `1` to `n+1` and check if each number is present in the array using a nested loop.
- If a number is not found, that's the missing one.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 2, 3, 4, 5, 7};
    int n = a.size();
    for (int i = 1; i <= n; i++) {
        int f = 0;
        for (int j = 0; j < n; j++) {
            if (a[j] == i) {
                f = 1;
                break;
            }
        }
        if (f == 0) {
            cout << i;
        }
    }
}
```

### ⏱️ Time Complexity: `O(n^2)`  
### 🗂️ Space Complexity: `O(1)`

---

## ⚡ Optimal Approach 1: Sum Formula

### 🔍 Logic:
- Calculate expected sum using formula `n*(n+1)/2`.
- Subtract actual sum of the array from this expected sum to get the missing number.

### ✅ Code:
```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int n = nums.size();
        int s = 0;
        for (int i = 0; i < n; i++) {
            s += nums[i];
        }
        int ms = n * (n + 1) / 2;
        return ms - s;
    }
};
```

### ⏱️ Time Complexity: `O(n)`  
### 🗂️ Space Complexity: `O(1)`

---

## ⚡ Optimal Approach 2: XOR Method

### 🔍 Logic:
- XOR all elements in the array and XOR with numbers from `1` to `n+1`.
- Duplicate XOR cancels out, leaving the missing number.

### ✅ Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 2, 3, 4, 5, 7};
    int n = a.size() - 1;
    int xor1 = 0, xor2 = 0;

    for (int i = 0; i < n; i++) {
        xor2 ^= a[i];
        xor1 ^= (i + 1);
    }
    xor1 ^= (n+1);

    int ans = xor1 ^ xor2;
    cout << ans;
}
```

### ⏱️ Time Complexity: `O(n)`  
### 🗂️ Space Complexity: `O(1)`

---

## ✅ Summary

| Approach          | Time Complexity | Space Complexity | Handles Duplicates | Sorting Required |
|------------------|------------------|------------------|---------------------|------------------|
| Brute Force       | O(n²)            | O(1)             | ✅ Yes              | ❌ No            |
| Sum Formula       | O(n)             | O(1)             | ❌ No               | ❌ No            |
| XOR Method        | O(n)             | O(1)             | ❌ No               | ❌ No            |

---

## 🧪 Test Case
**Input:**  
`a = {1, 2, 3, 4, 5, 7}`  
**Output:**  
`6`

---
