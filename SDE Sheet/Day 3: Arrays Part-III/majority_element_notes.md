
# 🗳️ Majority Element

## 🧩 Problem Statement

Given an array `nums` of size `n`, return the majority element.  
The majority element is the element that appears **more than ⌊n / 2⌋ times**.  
Assume that the majority element **always exists** in the array.

---

## 💥 Brute Force Approach

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        for (int i = 0; i < nums.size(); i++) {
            int c = 0;
            for (int j = 0; j < nums.size(); j++) {
                if (nums[i] == nums[j]) {
                    c++;
                }
            }
            if (c > nums.size() / 2) {
                return nums[i];
            }
        }
        return -1;
    }
};
```

### 🔍 Logic:
- For every element, count its occurrences.
- If count > n/2, return that element.

### ⏱️ Time Complexity:
- **O(n²)**

### 📦 Space Complexity:
- **O(1)**

---

## 🔁 Better Approach: Using Hash Map

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        map<int, int> mp;
        for (int i = 0; i < nums.size(); i++) {
            mp[nums[i]]++;
        }
        for (auto it : mp) {
            if (it.second > nums.size() / 2) {
                return it.first;
            }
        }
        return -1;
    }
};
```

### 🔍 Logic:
- Store frequency of each number in a map.
- Return the number whose frequency > n/2.

### ⏱️ Time Complexity:
- **O(n log n)** (due to map operations)

### 📦 Space Complexity:
- **O(n)**

---

## ⚡ Optimal Approach: Sorting

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        int n = nums.size();
        return nums[n / 2];
    }
};
```

### 🔍 Logic:
- If an element occurs more than n/2 times, it will be at the middle index after sorting.

### ⏱️ Time Complexity:
- **O(n log n)**

### 📦 Space Complexity:
- **O(1)** (excluding sort space)

---

## 💎 Best Approach: Moore's Voting Algorithm

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int count = 0;
        int el;

        for (int i = 0; i < nums.size(); i++) {
            if (count == 0) {
                count = 1;
                el = nums[i];
            } else if (nums[i] == el) {
                count++;
            } else {
                count--;
            }
        }

        int count1 = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == el) {
                count1++;
            }
        }

        if (count1 > nums.size() / 2) {
            return el;
        }
        return -1;
    }
};
```

### 🔍 Logic:
- Cancel out each occurrence of different pairs.
- The candidate left might be the majority, so verify it by counting its frequency.

### ⏱️ Time Complexity:
- **O(n)**

### 📦 Space Complexity:
- **O(1)**

---

## 🧠 Conclusion

| Approach              | Time Complexity | Space Complexity | Notes                         |
|-----------------------|------------------|-------------------|-------------------------------|
| Brute Force           | O(n²)            | O(1)              | Naive method                  |
| Hash Map              | O(n log n)       | O(n)              | Frequency count               |
| Sorting               | O(n log n)       | O(1)              | Relies on sorted properties   |
| **Moore's Voting ✅**  | **O(n)**         | **O(1)**          | Best for performance          |

✅ **Moore's Voting Algorithm** is the most efficient and optimal for this problem.

