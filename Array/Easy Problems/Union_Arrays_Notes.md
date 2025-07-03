
# 🔗 Union of Two Arrays

## 📌 Problem Statement

Given two arrays `nums1` and `nums2`, return a sorted array that contains the **union** of the two arrays (all unique elements from both arrays).

---

## 🧪 Example

```cpp
Input: nums1 = [1, 2, 3], nums2 = [2, 4, 5]  
Output: [1, 2, 3, 4, 5]
```

---

## 🛠️ Brute Force Approach (Using `set`)

### 💡 Logic

- Insert all elements from both arrays into a `set` to remove duplicates.
- Convert the set to a vector.

### 📦 Time Complexity

- **O((n + m) log(n + m))** — inserting into set takes log time per element.

### 🧠 Space Complexity

- **O(n + m)** — set stores all unique elements.

### ✅ Code

```cpp
class Solution {
public:
    vector<int> unionArray(vector<int>& nums1, vector<int>& nums2) {
        set<int> st;
        for(int i = 0; i < nums1.size(); i++) {
            st.insert(nums1[i]);
        }
        for(int i = 0; i < nums2.size(); i++) {
            st.insert(nums2[i]);
        }
        vector<int> uA;
        for(auto it : st) {
            uA.push_back(it);
        }
        return uA;
    }
};
```

---

## ⚡ Optimal Approach (Two Pointer Technique)

> **Condition**: Input arrays must be **sorted**.

### 💡 Logic

- Use two pointers `i` and `j` to traverse `a` and `b`.
- Skip duplicates by checking the last inserted element.
- Merge both arrays while avoiding duplicates.

### 📦 Time Complexity

- **O(n + m)** — each element is visited at most once.

### 🧠 Space Complexity

- **O(n + m)** — to store the union in the output vector.

### ✅ Code

```cpp
class Solution {
public:
    vector<int> unionArray(vector<int>& a, vector<int>& b) {
        int n1 = a.size();
        int n2 = b.size();
        int i = 0, j = 0;
        vector<int> ans;

        while(i < n1 && j < n2) {
            if(a[i] <= b[j]) {
                if(ans.size() == 0 || ans.back() != a[i]) {
                    ans.push_back(a[i]);
                }
                i++;
            } else {
                if(ans.size() == 0 || ans.back() != b[j]) {
                    ans.push_back(b[j]);
                }
                j++;
            }
        }

        while(i < n1) {
            if(ans.size() == 0 || ans.back() != a[i]) {
                ans.push_back(a[i]);
            }
            i++;
        }

        while(j < n2) {
            if(ans.size() == 0 || ans.back() != b[j]) {
                ans.push_back(b[j]);
            }
            j++;
        }

        return ans;
    }
};
```

---

## 📝 Summary

| Approach            | Time Complexity     | Space Complexity | Notes                          |
|---------------------|---------------------|------------------|---------------------------------|
| Brute Force (Set)   | O((n + m) log(n+m)) | O(n + m)         | Easy but not in-place          |
| Optimal (Two Pointers)| O(n + m)          | O(n + m)         | Requires sorted input arrays   |

---
