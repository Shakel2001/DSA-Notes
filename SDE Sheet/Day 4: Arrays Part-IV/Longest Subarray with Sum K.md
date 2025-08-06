# Longest Subarray with Sum K

## Problem Statement
Given an array of integers `arr` and an integer `k`, return the length of the longest subarray whose sum is equal to `k`.

---

## 💡 Brute Force Approach

### Logic
- For every subarray starting from each index `i`, calculate the sum till index `j`.
- If the sum equals `k`, update the maximum length.

### Code Snippet
```cpp
int longestSubarray(vector<int>& arr, int k) {
    int len = 0;
    for(int i = 0; i < arr.size(); i++) {
        int sum = 0;
        for(int j = i; j < arr.size(); j++) {
            sum += arr[j];
            if(sum == k) {
                len = max(len, j - i + 1);
            }
        }
    }
    return len;
}
```
### Time Complexity: O(n^2)

### Space Complexity: O(1)

* * * * *

⚡ Better / Optimal for All Integers (Positive + Negative)
---------------------------------------------------------

### Logic

-   Use a HashMap to store the first occurrence of each prefix sum.

-   If `prefixSum - k` exists in the map, update the length.

-   Handles both positive and negative numbers.

### Code Snippet

```cpp


int longestSubarray(vector<int>& arr, int k) {
    map<long long, int> preSum;
    long long sum = 0;
    int maxLen = 0;

    for(int i = 0; i < arr.size(); i++) {
        sum += arr[i];
        if(sum == k) {
            maxLen = max(maxLen, i + 1);
        }
        int rem = sum - k;
        if(preSum.find(rem) != preSum.end()) {
            int len = i - preSum[rem];
            maxLen = max(maxLen, len);
        }
        if(preSum.find(sum) == preSum.end()) {
            preSum[sum] = i;
        }
    }
    return maxLen;
}
```

### Time Complexity: O(n)

### Space Complexity: O(n)

* * * * *

🚀 Optimal for Only Positive Numbers
------------------------------------

### Logic (Two Pointer / Sliding Window)

-   Move the right pointer to increase the window sum.

-   If sum exceeds `k`, move the left pointer to shrink the window.

-   If sum equals `k`, update the length.

### Pseudocode

```cpp

int longestSubarray(vector<int>& arr, int k) {
    int i = 0, j = 0, sum = 0, maxLen = 0;
    while(j < arr.size()) {
        sum += arr[j];
        while(sum > k) {
            sum -= arr[i];
            i++;
        }
        if(sum == k) {
            maxLen = max(maxLen, j - i + 1);
        }
        j++;
    }
    return maxLen;
}
```

### Time Complexity: O(n)

### Space Complexity: O(1)

*Only works when all elements are positive*

* * * * *

✅ Example
---------

### Input:

`arr = [1, 2, 3, 1, 1, 1, 4, 2, 3]
k = 6`

### Output:

`3`

### Explanation:

Subarrays like [1,1,4], [2,3,1], or [1,1,1,3] give sum = 6. The maximum length = 3.

* * * * *

Summary Table
-------------

| Approach | Works For | Time Complexity | Space Complexity |
| --- | --- | --- | --- |
| Brute Force | All cases | O(n^2) | O(1) |
| HashMap (Optimal) | Positive + Negative | O(n) | O(n) |
| Two Pointer (Optimal) | Only Positive Numbers | O(n) | O(1) |
