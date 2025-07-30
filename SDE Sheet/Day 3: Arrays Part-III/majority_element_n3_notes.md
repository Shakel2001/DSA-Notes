
# Majority Element II (Appears More Than n/3 Times)

---

## 🧠 Problem Statement

Find all elements that appear more than ⌊ n/3 ⌋ times in a given integer array `nums`.

---

## ✅ Constraints

- The array can have **at most 2** majority elements appearing more than n/3 times.
- Return result in **any order**.
---

## ✅ Brute Force Approach

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
            if (c > nums.size() / 3) {
                return nums[i];
            }
        }
        return -1;
    }
};
```

- **Time Complexity:** O(N^2)
- **Space Complexity:** O(1)
- **Note:** This code returns only one majority element.

---

## ✅ Better Approach (Using Hash Map)

```cpp
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        map<int, int> mp;
        vector<int> ans;
        for (int i : nums) {
            mp[i]++;
        }
        for (auto it : mp) {
            if (it.second > nums.size() / 3) {
                ans.push_back(it.first);
            }
        }
        return ans;
    }
};
```

- **Time Complexity:** O(N log N) due to map operations
- **Space Complexity:** O(N)

---

## ✅ Optimal Approach (Moore’s Voting Algorithm for n/3)

```cpp
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        vector<int> ans;
        int c1 = 0, c2 = 0;
        int el1, el2;

        for (int i = 0; i < nums.size(); i++) {
            if (c1 == 0 && nums[i] != el2) {
                c1 = 1;
                el1 = nums[i];
            }
            else if (c2 == 0 && nums[i] != el1) {
                c2 = 1;
                el2 = nums[i];
            }
            else if (nums[i] == el1) c1++;
            else if (nums[i] == el2) c2++;
            else {
                c1--;
                c2--;
            }
        }

        // Verify candidates
        int c1c = 0, c2c = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == el1) c1c++;
            if (nums[i] == el2) c2c++;
        }

        if (c1c > nums.size() / 3) ans.push_back(el1);
        if (c2c > nums.size() / 3) ans.push_back(el2);

        sort(ans.begin(), ans.end());
        return ans;
    }
};
```

- **Time Complexity:** O(N)
- **Space Complexity:** O(1)

---

## ✅ Summary

| Approach        | Time Complexity | Space Complexity | Notes                           |
|----------------|------------------|------------------|---------------------------------|
| Brute Force     | O(N^2)           | O(1)             | Inefficient for large inputs    |
| Hash Map        | O(N log N)       | O(N)             | Better, but not optimal         |
| Moore Voting    | O(N)             | O(1)             | Best approach for this problem  |
