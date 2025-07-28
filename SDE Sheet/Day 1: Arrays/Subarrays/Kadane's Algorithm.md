💡 Kadane's Algorithm --- Maximum Subarray Sum
============================================

🧩 Problem Statement
--------------------

Given an array of integers, find the contiguous subarray (containing at least one number) which has the **largest sum**, and return its sum.

* * * * *

🧠 Concept
----------

Kadane's Algorithm is a **dynamic programming** approach that helps find the **maximum sum of a contiguous subarray** in linear time.

* * * * *

📘 Real-Life Analogy
--------------------

Imagine you're walking on a street where:

-   Every building gives you money (positive number),

-   Or charges you rent (negative number).

You want to choose a **contiguous stretch** of buildings such that your **total profit is maximum**. If at any point your total turns negative, you reset --- because starting fresh may give a better future sum.

* * * * *

✅ Key Idea
----------

-   Keep track of:

    -   `current_sum`: sum of the current subarray.

    -   `max_sum`: maximum subarray sum found so far.

-   If `current_sum` becomes negative, **reset it to 0**.

    -   Because a negative sum **hurts future subarrays**.

* * * * *

🧾 Algorithm Steps
------------------

1.  Initialize:

    -   `max_sum = INT_MIN` (to handle all negative arrays)

    -   `current_sum = 0`

2.  Loop through each element:

    -   Add current element to `current_sum`.

    -   Update `max_sum` if `current_sum` is greater.

    -   If `current_sum` < 0, reset `current_sum = 0`.

* * * * *

✅ Code (C++ Style)
------------------

cpp
```
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int maxS = INT_MIN; // Stores the final max subarray sum
        int sum = 0;        // Stores current running sum

        for(int i = 0; i < nums.size(); i++){
            sum += nums[i];          // Add current element
            maxS = max(maxS, sum);   // Update max if needed

            if(sum < 0) sum = 0;     // Reset sum if negative
        }

        return maxS;
    }
};
```

* * * * *

📊 Dry Run Example
------------------

Given: `nums = [-2, -3, 4, -1, -2, 1, 5, -3]`

| i | nums[i] | current_sum | max_sum |
| --- | --- | --- | --- |
| 0 | -2 | -2 | -2 |
| 1 | -3 | -3 → 0 | -2 |
| 2 | 4 | 4 | 4 |
| 3 | -1 | 3 | 4 |
| 4 | -2 | 1 | 4 |
| 5 | 1 | 2 | 4 |
| 6 | 5 | 7 | 7 ✅ |
| 7 | -3 | 4 | 7 |

🔹 Max Subarray = `[4, -1, -2, 1, 5]` → Sum = **7**

* * * * *

📈 Time & Space Complexity
--------------------------

| Metric | Value |
| --- | --- |
| Time Complexity | `O(n)` |
| Space Complexity | `O(1)` |
| Extra Space Used | Constant |

* * * * *

📌 Notes
--------

-   Works for both **positive** and **negative** elements.

-   If all elements are negative, Kadane still returns the **maximum (least negative)**.

-   This is a **popular interview question** for companies like Google, Amazon, Microsoft, etc.

* * * * *

💬 Final Thought
----------------

Kadane's Algorithm is a classic example of solving a problem with **local and global tracking**:

-   Local = `current_sum`

-   Global = `max_sum`

It's one of the most **efficient** and elegant solutions in Dynamic Programming.
