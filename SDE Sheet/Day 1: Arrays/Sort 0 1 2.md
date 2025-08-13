🎨 Sort Colors (Leetcode 75)
============================

🧩 Problem Statement
--------------------

Given an array `nums` containing only `0`, `1`, and `2`, **sort the array in-place** so that all `0`s come first, followed by all `1`s, then all `2`s.

Problem link
============

Sort Colors (LeetCode 75) --- <https://leetcode.com/problems/sort-colors/description/>

* * * * *

🧠 Approach 1: Counting Sort (Better)
-------------------------------------

### ✅ Idea

1.  Count number of 0s, 1s, and 2s.

2.  Overwrite the array with that many 0s, 1s, and 2s.

### 📘 Code

cpp

```

class Solution {
public:
    void sortColors(vector<int>& nums) {
        int zc = 0, oc = 0, tc = 0;

        for (int num : nums) {
            if (num == 0) zc++;
            else if (num == 1) oc++;
            else tc++;
        }

        for (int i = 0; i < zc; i++) nums[i] = 0;
        for (int i = 0; i < oc; i++) nums[zc + i] = 1;
        for (int i = 0; i < tc; i++) nums[zc + oc + i] = 2;
    }
};

```

### 📈 Time & Space

-   **Time:** `O(n)`

-   **Space:** `O(1)` (though we traverse 2 times)

* * * * *

🚀 Approach 2: Dutch National Flag Algorithm (Optimal)
------------------------------------------------------

### ✅ Idea

Use **3 pointers**:

-   `low`: next position for 0

-   `mid`: current element to check

-   `high`: next position for 2

### 📘 Code

cpp

```
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int low = 0, mid = 0, high = nums.size() - 1;

        while (mid <= high) {
            if (nums[mid] == 0) {
                swap(nums[mid], nums[low]);
                low++;
                mid++;
            }
            else if (nums[mid] == 1) {
                mid++;
            }
            else {
                swap(nums[mid], nums[high]);
                high--;
            }
        }
    }
};
```

### 📊 Dry Run

For: `nums = [2, 0, 2, 1, 1, 0]`

-   Step-by-step swaps move 0s to front, 2s to end, and 1s stay in place.

-   Final output: `[0, 0, 1, 1, 2, 2]`

### 📈 Time & Space

-   **Time:** `O(n)` (one pass)

-   **Space:** `O(1)` (in-place)

* * * * *

🏁 Conclusion
-------------

| Method | Passes | Space | Speed |
| --- | --- | --- | --- |
| Counting Sort | 2 | O(1) | Good |
| Dutch Flag (Optimal) | 1 | O(1) | ✅ Best |

> 💡 Always go with the **Dutch National Flag Algorithm** in interviews for in-place sorting of 0s, 1s, and 2s.
