
# 🔁 Intersection of Two Arrays

## 🧠 Problem Statement
Given two arrays `a` and `b`, return their intersection:
- Brute-force: Works on both sorted and unsorted arrays.
- Optimal (Two Pointer): Works on **sorted arrays with duplicates**.
- Optimal (Set): Works on unsorted arrays but gives **unique** intersection.

---

## 📌 Example
**Input:**  
`a = {1, 2, 3, 3, 4, 4, 5}`  
`b = {2, 2, 3, 3, 4, 4, 5}`  

**Output:**  
`2 3 3 4 4 5` (includes duplicates)

---

## 🐌 Brute Force Approach

### 🔍 Logic:
- For each element in array `a`, check if it exists in array `b`.
- Once matched, **remove** it or **mark it visited** to avoid repeating.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 2, 3, 3, 4, 4, 5};
    vector<int> b = {2, 2, 3, 3, 4, 4, 5};
    vector<int> ans;
    vector<bool> visited(b.size(), false);

    for (int i = 0; i < a.size(); i++) {
        for (int j = 0; j < b.size(); j++) {
            if (a[i] == b[j] && !visited[j]) {
                ans.push_back(a[i]);
                visited[j] = true;
                break;
            }
        }
    }

    for (int i : ans) {
        cout << i << " ";
    }
}
```

### ⏱️ Time Complexity: `O(n1 * n2)`  
### 🗂️ Space Complexity: `O(n2)` for visited array

---

## ⚡ Optimal Approach 1: Two Pointer (Sorted Arrays with Duplicates)

### 🔍 Logic:
- Since both arrays are **sorted**, we can use two pointers (`i` and `j`) to iterate through both arrays.
- If `a[i] < b[j]`: move `i++`
- If `a[i] > b[j]`: move `j++`
- If both are equal: it's part of the intersection → push to `ans`, and increment both pointers.

This ensures we **preserve duplicates** that appear in both arrays.

### ✅ Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 2, 3, 3, 4, 4, 5};
    vector<int> b = {2, 2, 3, 3, 4, 4, 5};
    vector<int> ans;

    int n1 = a.size();
    int n2 = b.size();
    int i = 0, j = 0;

    while (i < n1 && j < n2) {
        if (a[i] < b[j]) {
            i++;
        }
        else if (b[j] < a[i]) {
            j++;
        }
        else {
            ans.push_back(a[i]);
            i++;
            j++;
        }
    }

    for (int val : ans) {
        cout << val << " ";
    }
}
```

### ⏱️ Time Complexity:
- **O(n1 + n2)** – Each element of both arrays is processed at most once.

### 🗂️ Space Complexity:
- **O(k)** – For storing the result (intersection elements).

---

## ⚡ Optimal Approach 2: Using Sets (Unique Elements Only)

### 🔍 Logic:
- Store elements of one array in a set.
- Traverse second array, if element is found in the set → add to result set.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 2, 3, 3, 4, 4, 5};
    vector<int> b = {2, 2, 3, 3, 4, 4, 5};
    unordered_set<int> s(a.begin(), a.end());
    unordered_set<int> result;

    for (int val : b) {
        if (s.find(val) != s.end()) {
            result.insert(val); // ensures uniqueness
        }
    }

    for (int i : result) {
        cout << i << " ";
    }
}
```

### ⏱️ Time Complexity: `O(n1 + n2)`  
### 🗂️ Space Complexity: `O(n1 + n2)`  

⚠️ **Note:** This approach returns only **unique elements** in the intersection.

---

## ✅ Summary

| Approach            | Handles Duplicates | Requires Sorting | Time       | Space     |
|---------------------|--------------------|------------------|------------|-----------|
| Brute Force         | ✅ Yes             | ❌ No            | O(n1 * n2) | O(n2)     |
| Two Pointer         | ✅ Yes             | ✅ Yes           | O(n1 + n2) | O(1)      |
| Set-based           | ❌ No (Unique Only)| ❌ No            | O(n1 + n2) | O(n1+n2)  |

---

## 🧪 Example Test Case
**Input:**  
`a = {1,2,3,3,4,4,5}`  
`b = {2,2,3,3,4,4,5}`

**Output:**  
`2 3 3 4 4 5`

---
