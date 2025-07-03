
# 🚀 Move Zeroes to End of Array

## 📌 Problem Statement

Given an array `nums`, move all `0`s to the end while maintaining the relative order of the non-zero elements.

---

## 🧪 Example

**Input:**  
`nums = [0, 1, 0, 3, 12]`

**Output:**  
`[1, 3, 12, 0, 0]`

---

## 💡 Brute Force Approach

### 🔸 Logic

1. Store all non-zero elements in a temporary array.
2. Overwrite the original array with these elements.
3. Fill the remaining positions with `0`.

### 📦 Time Complexity

- **O(n)** — two traversals of the array.

### 🧠 Space Complexity

- **O(n)** — uses extra space for `temp` array.

### ✅ Code

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        vector<int> temp;
        for(int i = 0; i < nums.size(); i++) {
            if(nums[i] != 0) {
                temp.push_back(nums[i]);
            }
        }
        for(int i = 0; i < nums.size(); i++) {
            if(i < temp.size()) {
                nums[i] = temp[i];
            } else {
                nums[i] = 0;
            }
        }
    }
};
```

---

## ⚡ Optimal Approach (Two-Pointer Technique)

### 🔸 Logic

1. Find the first zero's index `j`.
2. Traverse the array from `j+1`.
3. For every non-zero element, swap it with element at `j` and increment `j`.

### 📦 Time Complexity

- **O(n)** — single traversal with constant-time swaps.

### 🧠 Space Complexity

- **O(1)** — in-place swapping, no extra space used.

### ✅ Code

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = -1;
        for(int i = 0; i < nums.size(); i++) {
            if(nums[i] == 0) {
                j = i;
                break;
            }
        }
        for(int i = j + 1; i < nums.size(); i++) {
            if(nums[i] != 0) {
                swap(nums[i], nums[j]);
                j++;
            }
        }
    }
};
```

---

## 📝 Summary

| Approach             | Time Complexity | Space Complexity | Description                         |
|----------------------|-----------------|------------------|-------------------------------------|
| Brute Force          | O(n)            | O(n)             | Uses extra array                    |
| Optimal (Two-Pointer)| O(n)            | O(1)             | In-place, efficient                 |

---
