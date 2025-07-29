# 🧠 Find the Duplicate Number (Leetcode 287)

## 📝 Problem Statement

Given an array of integers `nums` containing `n + 1` integers where each integer is in the range `[1, n]`, return the **duplicate number**.

- You must **not** modify the array (if possible).
- You must use only constant, **O(1) extra space**.
- The runtime complexity should be less than **O(n²)**.

---

## ✅ Constraints

- `1 <= nums.length <= 10^5`
- `nums` contains **at least one duplicate**
- All values are in the range `[1, n]`, where `n = nums.size() - 1`

---

## 🔍 Approach 1: Frequency Array (Extra Space)

```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int m = nums.size();
        vector<int> a(m + 1, 0);
        for (int i = 0; i < m; i++) {
            a[nums[i]]++;
        }
        for (int i = 0; i < m; i++) {
            if (a[i] >= 2) {
                return i;
            }
        }
        return 0;
    }
};
```
### ✅ Logic:

-   Create a frequency array to count the occurrences of each number.

-   Return the number which occurs more than once.

### ⏱️ Time Complexity: `O(n)`

### 🧠 Space Complexity: `O(n)`

### ❌ Not optimal in terms of space (extra array used).
* * * * *

🔍 Approach 2: Sort and Compare
-------------------------------
```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        for (int i = 1; i < nums.size(); i++) {
            if (nums[i - 1] == nums[i]) {
                return nums[i];
            }
        }
        return 0;
    }
};
```
### ✅ Logic:

-   First, sort the array.

-   Duplicate elements will appear next to each other.

-   Traverse and compare adjacent elements to find the duplicate.

### ⏱️ Time Complexity: `O(n log n)` --- for sorting

### 🧠 Space Complexity: `O(1)` --- in-place sort

### ⚠️ Modifies the array --- not allowed if the array must remain unchanged.

* * * * *

💡 Approach 3: Floyd's Tortoise and Hare (Cycle Detection)
----------------------------------------------------------
```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int slow = nums[0];
        int fast = nums[0];

        // Phase 1: Detect cycle
        do {
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while (slow != fast);

        // Phase 2: Find the entrance to the cycle
        slow = nums[0];
        while (slow != fast) {
            slow = nums[slow];
            fast = nums[fast];
        }

        return slow;
    }
};
```
### ✅ Logic:

-   Treat each index and value as a node and next pointer in a linked list.

-   Since there is a duplicate, a cycle will be formed.

-   Use two pointers (slow and fast) to detect the cycle (Floyd's algorithm).

-   Then, reset one pointer and move both at the same pace to find the entry point of the cycle (which is the duplicate).

### ⏱️ Time Complexity: `O(n)`

### 🧠 Space Complexity: `O(1)`

### ✅ Best and most optimal approach --- does not modify the array and uses constant space.

* * * * *

✅ Summary Table
---------------

| Approach | Time | Space | Modifies Input? | Optimal? |
| --- | --- | --- | --- | --- |
| Frequency Array | O(n) | O(n) | ❌ | ❌ |
| Sort and Compare | O(n log n) | O(1) | ✅ | ❌ |
| Floyd's Cycle Detection | O(n) | O(1) | ❌ | ✅ |

* * * * *

📌 Test Case Examples
```cpp
Input: nums = [1,3,4,2,2]
Output: 2

Input: nums = [3,1,3,4,2]
Output: 3
```
