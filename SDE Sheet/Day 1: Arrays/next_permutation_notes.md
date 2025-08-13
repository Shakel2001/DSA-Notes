
# 🔁 Next Permutation – C++ Implementation

## 🧠 Problem Statement
Given an array of integers `nums`, rearrange the numbers to get the **next lexicographically greater permutation**. If such arrangement is not possible, rearrange it as the **lowest possible order** (i.e., sorted in ascending order).

---
Problem link
============

Next Permutation (LeetCode 31) --- <https://leetcode.com/problems/next-permutation/description/>

## ✅ Approach: Efficient (O(n))

### 💡 Logic:
1. **Find the Break Point**:
   - Traverse from the back and find the first index `i` such that `nums[i-1] < nums[i]`.
   - Call this index `idx = i-1`. If not found, the array is in descending order – return sorted array.

2. **Find the Next Greater Element**:
   - Traverse again from the back and find the first number greater than `nums[idx]`.
   - Swap them.

3. **Reverse the Remaining Part**:
   - Sort the array from `idx+1` to the end to get the next smallest lexicographic permutation.

---

## 🧾 Code (C++):
```cpp
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        int idx = -1;

        // Step 1: Find break point
        for (int i = nums.size() - 1; i > 0; i--) {
            if (nums[i - 1] < nums[i]) {
                idx = i - 1;
                break;
            }
        }

        // Step 2: If no break point, reverse to smallest permutation
        if (idx == -1) {
            sort(nums.begin(), nums.end());
        } else {
            // Step 3: Find next greater element and swap
            for (int i = nums.size() - 1; i >= idx; i--) {
                if (nums[i] > nums[idx]) {
                    swap(nums[i], nums[idx]);
                    break;
                }
            }
            // Step 4: Sort the suffix
            sort(nums.begin() + idx + 1, nums.end());
        }
    }
};
```

---

## 🔢 Example

### Input:
```
nums = [1, 2, 3]
```
### Output:
```
[1, 3, 2]
```

### Input:
```
nums = [3, 2, 1]
```
### Output:
```
[1, 2, 3]
```

---

## ⏱ Time Complexity
- Worst case: **O(n)** (full traversal + partial sort)

## 💾 Space Complexity
- **O(1)** in-place

---

## 📌 Notes
- Lexicographic order means "dictionary" order.
- When no larger permutation is possible, return smallest permutation (sorted array).
- Works efficiently for large arrays.

