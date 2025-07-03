# 🔍 Find the Largest Element in an Array (C++)

This C++ implementation finds the **largest element** in a given vector of integers. It demonstrates a simple **linear traversal** to compare and update the maximum value.

---

## ✅ Problem Statement

Given a list of integers, find and return the **largest element** from the list.

---

## 💡 Approach & Logic

We initialize the largest element `l` as the **first element** of the array. Then we traverse the array starting from index 1, comparing each element to `l`. If the current element is greater than `l`, we update `l` with that value.

---

### 🔁 Step-by-Step Logic

1. Set `l = nums[0]`.
2. Loop through the array from index `1` to `n-1`.
3. For each element:
   - If it is greater than `l`, update `l`.
4. Return `l` as the largest element.

---

## ⏱️ Time & Space Complexity

| Operation       | Complexity |
|----------------|------------|
| Time Complexity | `O(n)`     |
| Space Complexity| `O(1)`     |

We only use a single variable (`l`) to store the result and scan the array once.

---

## 🧩 C++ Code

```cpp
class Solution {
public:
    int largestElement(vector<int>& nums) {
        int l = nums[0];  // Initialize with the first element

        for (int i = 1; i < nums.size(); i++) {
            if (nums[i] > l) {
                l = nums[i];  // Update if a larger element is found
            }
        }

        return l;  // Return the largest value found
    }
};
