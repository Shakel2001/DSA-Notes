
# 🔍 Find the Single Number (Element Appearing Once)

## 🧠 Problem Statement
Given a non-empty array of integers where every element appears **twice** except for one, find that single one.

---

## 📌 Example
**Input:**  
`a = {1,1,2,2,3,3,4,4,5,5,6,6,7}`  

**Output:**  
`7`  
(All other numbers appear twice, only `7` appears once)

---

## 🐌 Brute Force Approach

### 🔍 Logic:
- Use two nested loops to count the frequency of each element.
- Print the element with frequency = 1.

⚠️ Not efficient for large input sizes.

### ⏱️ Time Complexity: `O(n^2)`  
### 🗂️ Space Complexity: `O(1)`  
(Note: No code shown as user focused on better and optimal)

---

## ✅ Better Approach: Using `map`

### 🔍 Logic:
- Use a hashmap (or `map`) to count the frequency of each element.
- Then, find the key with frequency = 1.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1,1,2,2,3,3,4,4,5,5,6,6,7};
    map<int, int> mp;

    for (int i = 0; i < a.size(); i++) {
        mp[a[i]]++;
    }

    for (auto it : mp) {
        if (it.second == 1) {
            cout << it.first;
        }
    }
}
```

### ⏱️ Time Complexity: `O(n log n)` (due to ordered map)  
### 🗂️ Space Complexity: `O(n)`

---

## ⚡ Optimal Approach: XOR Method

### 🔍 Logic:
- XOR of two same numbers is 0: `a ^ a = 0`
- XOR of 0 and any number `x` is `x`: `0 ^ x = x`
- So, XOR all elements → duplicates cancel out → only the unique number remains.

### ✅ Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1,1,2,2,3,3,4,4,5,5,6,6,7};
    int xor1 = 0;

    for (int i = 0; i < a.size(); i++) {
        xor1 ^= a[i];
    }

    cout << xor1;
}
```

### ⏱️ Time Complexity: `O(n)`  
### 🗂️ Space Complexity: `O(1)`

---

## ✅ Summary

| Approach        | Time Complexity | Space Complexity | Handles Large Inputs | Extra Notes                |
|----------------|------------------|------------------|-----------------------|----------------------------|
| Brute Force     | O(n²)            | O(1)             | ❌                    | Not preferred              |
| Map-Based       | O(n log n)       | O(n)             | ✅                    | Uses extra space           |
| XOR Method      | O(n)             | O(1)             | ✅✅                   | Most efficient, no space   |

---

## 🧪 Test Case
**Input:**  
`a = {1,1,2,2,3,3,4,4,5,5,6,6,7}`  
**Output:**  
`7`

---
