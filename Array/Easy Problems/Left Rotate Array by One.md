# 🔁 Rotate Array by One Position (Left Rotation)

## 🧠 Problem Statement

Rotate the given array to the left by **one position**.

For example:  
Input: `[1, 2, 3, 4, 5]`  
Output: `[2, 3, 4, 5, 1]`

---

## 🚀 Optimal Approach: In-Place Rotation

### ✅ Logic

- Store the first element in a temporary variable (`temp = nums[0]`).
- Shift all elements one position to the left.
  - For each index `i` from `1` to `n-1`, move `nums[i]` to `nums[i - 1]`.
- Assign the stored element (`temp`) to the last position.

---

## 🧮 Time and Space Complexity

| Complexity | Value |
|------------|-------|
| ⏱️ Time     | `O(n)` - We iterate over the array once |
| 🗂️ Space    | `O(1)` - No extra space is used (in-place) |

---

## 💻 C++ Code

```cpp
class Solution {
public:
    void rotateArrayByOne(vector<int>& nums) {
        int temp = nums[0]; // Store first element
        for (int i = 1; i < nums.size(); i++) {
            nums[i - 1] = nums[i]; // Shift element to the left
        }
        nums[nums.size() - 1] = temp; // Put first element at the end
    }
};
