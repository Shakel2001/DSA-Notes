# 🧹 Remove Duplicates from a Sorted Array (C++)

This repo demonstrates two approaches to remove duplicates from a sorted array:
- 🔁 Brute-force using `set`
- ⚡ Optimal in-place solution using two pointers

---

## 📘 Problem Statement

Given a **sorted array**, remove the duplicates **in-place** such that each unique element appears only once and return the new length.  
You must do this using **O(1)** extra space for the optimal version.

---

## 📌 Constraints

- The array is sorted in **non-decreasing order**.
- Do not allocate extra space for another array (for the optimal version).

---

## 🧪 Example

```cpp
Input:  [1, 1, 1, 2, 3, 4, 4, 5, 5, 7]
Output: [1, 2, 3, 4, 5, 7]
New length: 6
```
# 🔁 Remove Duplicates – Brute-force vs Optimal Approach

This note covers two common approaches to remove duplicates from a **sorted array**:

- 🔁 Brute-force using `set`
- ⚡ Optimal in-place using Two Pointers

---

## 🔁 Brute-force Approach (Using `set`)

### 🧠 Logic

- Use a `set` to store only unique elements.
- Copy those unique elements back into the original array.
- Return the count of unique elements inserted.

### ⏱️ Time & Space Complexity

| Metric           | Complexity            |
|------------------|------------------------|
| Time Complexity  | `O(n log n)` (due to set operations) |
| Space Complexity | `O(n)` (extra set used) |

### 🧾 Code

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int arr[10] = {1, 1, 1, 2, 3, 4, 4, 5, 5, 7};
    set<int> st;

    for (int i = 0; i < 10; i++) {
        st.insert(arr[i]);  // store only unique values
    }

    int index = 0;
    for (auto it : st) {
        arr[index] = it;  // copy back unique values
        index++;
    }

    cout << "New length: " << index << endl;  // Output: 6
}
```
# ⚡ Optimal Approach – Remove Duplicates from Sorted Array (Two-Pointer Technique)

This method removes duplicates from a **sorted array** in-place using the **two-pointer technique**, ensuring optimal time and space complexity.

---

## 🧠 Logic

- Use pointer `i` to track the position of the **last unique** element.
- Use pointer `j` to **traverse** the array from index 1 onward.
- When `nums[j] != nums[i]`, we found a new unique element.
  - Copy `nums[j]` to `nums[i + 1]`
  - Increment `i`

---

## ⏱️ Time & Space Complexity

| Metric           | Complexity |
|------------------|------------|
| Time Complexity  | `O(n)`     |
| Space Complexity | `O(1)`     |

No extra space is used. Only a single pass is needed through the array.

---

## 🧾 Code

```cpp
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int i = 0;
        for (int j = 1; j < nums.size(); j++) {
            if (nums[j] != nums[i]) {
                nums[i + 1] = nums[j];
                i++;
            }
        }
        return i + 1;
    }
};


