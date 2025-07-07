
# 🧮 Longest Subarray with Sum `K`

## 🧠 Problem Statement
Given an array `a` and a number `k`, find the **length of the longest subarray** whose sum equals `k`.

---

## 📌 Example
**Input:**  
`a = {1, 1, 2, 3, 4, 5, 6, 7}`, `k = 7`  
**Output:**  
`3` (subarray `{1, 2, 4}` or `{3, 4}`)

---

## 🐌 Brute Force Approach

### 🔍 Logic:
- Generate all subarrays using two loops.
- For each subarray, calculate sum and check if it equals `k`.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 1, 2, 3, 4, 5, 6, 7};
    int k = 7;
    int mL = 0;

    for (int i = 0; i < a.size(); i++) {
        int s = 0;
        for (int j = i; j < a.size(); j++) {
            s += a[j];
            if (s == k) {
                mL = max(mL, (j - i + 1));
            }
        }
    }

    cout << mL;
}
```

### ⏱️ Time Complexity: `O(n^2)`  
### 🗂️ Space Complexity: `O(1)`

---

## ✅ Better Approach (Handles Negative Values Too)

### 🔍 Logic:
- Use prefix sum and hashmap.
- Store the first occurrence of each prefix sum.
- If `prefix_sum - k` is found in map, a subarray with sum `k` exists.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> a = {1, 1, 2, 3, 4, 5, 6, 7};
    int k = 7;
    map<long long, int> mp;
    long long sum = 0;
    int maxL = 0;

    for (int i = 0; i < a.size(); i++) {
        sum += a[i];

        if (sum == k) {
            maxL = max(maxL, i + 1);
        }

        long long rem = sum - k;
        if (mp.find(rem) != mp.end()) {
            int len = i - mp[rem];
            maxL = max(maxL, len);
        }

        if (mp.find(sum) == mp.end()) {
            mp[sum] = i;
        }
    }

    cout << maxL;
}
```

### ⏱️ Time Complexity: `O(n)`  
### 🗂️ Space Complexity: `O(n)`  
✅ **Best approach for negative numbers**

---

## ⚡ Optimal Approach (Positive Numbers Only)

### 🔍 Logic:
- Use sliding window (two pointers).
- Shrink window from left when sum exceeds `k`.
- Increase window by moving right.

### ✅ Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

int getLongestSubarray(vector<int>& nums, int k) {
    int left = 0, right = 0;
    int sum = nums[0], maxL = 0;
    int n = nums.size();

    while (right < n) {
        while (left <= right && sum > k) {
            sum -= nums[left];
            left++;
        }

        if (sum == k) {
            maxL = max(maxL, right - left + 1);
        }

        right++;
        if (right < n) {
            sum += nums[right];
        }
    }

    return maxL;
}
```

### ⏱️ Time Complexity: `O(n)`  
### 🗂️ Space Complexity: `O(1)`  
⚠️ Works only when all elements are **non-negative**

---

## ✅ Summary

| Approach         | Handles Negatives | Time Complexity | Space Complexity | Technique      |
|------------------|-------------------|------------------|------------------|----------------|
| Brute Force       | ✅ Yes           | O(n²)            | O(1)             | Nested Loops   |
| Prefix Sum + Map  | ✅ Yes           | O(n)             | O(n)             | Hashing        |
| Sliding Window     | ❌ No (Positive only) | O(n)        | O(1)             | Two Pointers   |

---

## 🧪 Test Case
**Input:**  
`a = {1, 1, 2, 3, 4, 5, 6, 7}`  
`k = 7`  
**Output:**  
`3`

---
