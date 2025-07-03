# ✅ Check if an Array is Sorted in Non-Decreasing Order (C++)

This function checks whether a given array of integers is **sorted in non-decreasing order** (i.e., each element is greater than or equal to the previous one).

---

## 📘 Problem Statement

Given an array of integers `nums`, return `true` if the array is sorted in **non-decreasing** order, otherwise return `false`.

---

## 💡 Approach

1. Start from the second element (index `1`) of the array.
2. For each element:
   - Compare it with the previous one.
   - If `nums[i] < nums[i-1]`, then the array is not sorted — return `false`.
3. If the loop finishes without finding any such case, return `true`.

---

## ⏱️ Time and Space Complexity

| Metric            | Value     |
|-------------------|-----------|
| Time Complexity   | `O(n)`    |
| Space Complexity  | `O(1)`    |

We only loop once through the array and use no extra space.

---

## ✅ C++ Code

```cpp
class Solution {	
public:
    bool isSorted(vector<int>& nums) {
        for (int i = 1; i < nums.size(); i++) {
            if (nums[i] < nums[i - 1]) {
                return false;  // Found a violation of sorting
            }
        }
        return true;  // Array is sorted
    }
};
