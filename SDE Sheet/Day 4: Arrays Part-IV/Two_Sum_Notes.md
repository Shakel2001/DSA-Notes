# 🧠 Two Sum Problem – Brute Force, Better & Optimal Approaches

## 📝 Problem Statement
Given an array of integers `nums` and an integer `target`, return **indices** of the two numbers such that they add up to `target`.

You may assume that each input would have **exactly one solution**, and you may not use the same element twice.

---

## ✅ Brute Force Approach

### 🔍 Logic
- Use two nested loops to try every pair of elements in the array.
- For each pair `(i, j)`, check if `nums[i] + nums[j] == target`.
- If found, return the pair of indices.

### 📦 Code
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        for(int i = 0; i < nums.size(); i++) {
            for(int j = i + 1; j < nums.size(); j++) {
                if(nums[i] + nums[j] == target) {
                    return {i, j};
                }
            }
        }
        return {-1, -1};
    }
};
```

### ⏱ Time Complexity
- `O(n^2)` — where `n` is the number of elements in the array.

### 🧠 Space Complexity
- `O(1)` — no extra space used.

---

## 🚀 Better Approach – Using Hash Map

### 🔍 Logic
- Use a map to store each element and its index.
- For each element `a`, compute `target - a` and check if it's in the map.
- If found, return indices.

### 📦 Code
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> mp;
        for(int i = 0; i < nums.size(); i++) {
            int a = nums[i];
            int more = target - a;
            if(mp.find(more) != mp.end()) {
                return {mp[more], i};
            }
            mp[a] = i;
        }
        return {};
    }
};
```

### ⏱ Time Complexity
- `O(n log n)` — because `map` operations take `O(log n)` time.

### 🧠 Space Complexity
- `O(n)` — extra space used for the map.

---

## ⚡ Optimal Approach – Using Unordered Map

### 🔍 Logic
- Same logic as the better approach, but uses `unordered_map` for constant time lookups.

### 📦 Code
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> mp;
        for(int i = 0; i < nums.size(); i++) {
            int diff = target - nums[i];
            if(mp.find(diff) != mp.end()) {
                return {mp[diff], i};
            }
            mp[nums[i]] = i;
        }
        return {};
    }
};
```

### ⏱ Time Complexity
- `O(n)` — due to constant time `unordered_map` operations.

### 🧠 Space Complexity
- `O(n)` — for storing elements in the map.

---

## 🧪 Example Test Case

```cpp
Input: nums = [2, 7, 11, 15], target = 9  
Output: [0, 1]  
Explanation: nums[0] + nums[1] == 2 + 7 == 9
```

---

## 🔚 Conclusion
- **Brute Force** is simple but slow.
- **Better Approach** improves performance using a `map`.
- **Optimal Approach** further improves it with an `unordered_map` for faster lookups.

Choose based on constraints and performance needs.