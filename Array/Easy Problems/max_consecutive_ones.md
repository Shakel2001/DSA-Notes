
# 🔢 Find Maximum Consecutive 1s

## 🧠 Problem Statement
Given a binary array `nums`, return the maximum number of consecutive `1`s in the array.

---

## 📌 Example
**Input:**  
`nums = {1, 1, 0, 1, 1, 1}`  

**Output:**  
`3`  
(There are three consecutive 1s)

---

## ⚡ Optimal Approach: Linear Scan with Counter

### 🔍 Logic:
- Use a variable `count` to count consecutive `1`s.
- Use `maxCount` to keep track of the maximum so far.
- Reset `count` to 0 if a `0` is encountered.
- At each `1`, update `maxCount = max(maxCount, count)`.

### ✅ Code:
```cpp
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int maxCount = 0;
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == 1) {
                count++;
                maxCount = max(maxCount, count);
            } else {
                count = 0;
            }
        }
        return maxCount;
    }
};
```

---

## ⏱️ Time Complexity:
- **O(n)** – Iterate through all elements once.

## 🗂️ Space Complexity:
- **O(1)** – Uses only two integer variables.

---

## 🧪 Test Case
**Input:**  
`nums = {1, 0, 1, 1, 0, 1}`  
**Output:**  
`2`

---

## ✅ Summary
- Efficient for very large binary arrays.
- Logic is based on tracking a streak (`count`) and keeping the maximum streak (`maxCount`).
