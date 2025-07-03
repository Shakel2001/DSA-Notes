# 🥈 Find the Second Largest Element in an Array (C++)

This C++ implementation finds the **second largest unique element** in an integer array using a single-pass linear traversal.

---

## 📘 Problem Statement

Given an array of integers, return the second largest **distinct** element.  
If no such element exists (e.g., all elements are equal), return `-1`.

---

## 💡 Approach

1. Initialize two variables:
   - `fl` (first largest) = `INT_MIN`
   - `sl` (second largest) = `INT_MIN`

2. Traverse the array:
   - If the current number is greater than `fl`, update `sl = fl` and then `fl = current`.
   - Else if it’s greater than `sl` but less than `fl`, update `sl = current`.

3. Return `sl` if it’s valid, else return `-1`.

---

## 🔁 Step-by-Step Example

Input: `{4, 7, 1, 7, 5}`  
- `fl = 7`  
- `sl = 5`  

Output: `5`

---

## 🧠 Time and Space Complexity

| Metric            | Value     |
|-------------------|-----------|
| Time Complexity   | `O(n)`    |
| Space Complexity  | `O(1)`    |

---

## ✅ Code

```cpp
class Solution {
public:
    int secondLargestElement(vector<int>& nums) {
        int fl = INT_MIN;  // first largest
        int sl = INT_MIN;  // second largest

        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] > fl) {
                sl = fl;
                fl = nums[i];
            } else if (nums[i] > sl && nums[i] < fl) {
                sl = nums[i];
            }
        }

        return (sl == INT_MIN) ? -1 : sl;
    }
};
