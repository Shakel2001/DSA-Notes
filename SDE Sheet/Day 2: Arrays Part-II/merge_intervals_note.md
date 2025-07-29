
# Merge Intervals - Brute Force and Optimal Solutions

## 🧠 Problem Statement
Given an array of intervals where intervals[i] = [start_i, end_i], merge all overlapping intervals and return an array of the non-overlapping intervals that cover all the intervals in the input.

---

## 💡 Brute Force Approach

```cpp
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        int n = intervals.size();
        sort(intervals.begin(), intervals.end());
        vector<vector<int>> ans;
        for (int i = 0; i < n; i++) {
            int start = intervals[i][0];
            int end = intervals[i][1];
            if (!ans.empty() && end <= ans.back()[1]) {
                continue;
            }
            for (int j = i + 1; j < n; j++) {
                if (intervals[j][0] <= end) {
                    end = max(end, intervals[j][1]);
                } else {
                    break;
                }
            }
            ans.push_back({start, end});
        }
        return ans;
    }
};
```

### 🔍 Explanation:
- First sort all the intervals based on start time.
- Iterate through each interval.
- For each interval, try to merge it with all possible overlapping intervals ahead of it.
- Skip intervals that are already covered by the previous merged interval.

### ⏱️ Time Complexity:
- Sorting: `O(n log n)`
- Merging loop: Worst case `O(n^2)`
- **Overall:** `O(n^2)` in worst case

---

## ⚡ Optimal Approach

```cpp
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& arr) {
        int n = arr.size();
        sort(arr.begin(), arr.end());
        vector<vector<int>> ans;
        for (int i = 0; i < n; i++) {
            if (ans.empty() || arr[i][0] > ans.back()[1]) {
                ans.push_back(arr[i]);
            } else {
                ans.back()[1] = max(ans.back()[1], arr[i][1]);
            }
        }
        return ans;
    }
};
```

### ✅ Explanation:
- Sort the intervals based on starting time.
- If current interval does **not** overlap with the last interval in `ans`, add it.
- Else, merge it with the last interval in `ans`.

### ⏱️ Time Complexity:
- Sorting: `O(n log n)`
- Single pass: `O(n)`
- **Overall:** `O(n log n)`

---

## 🧠 Visual Example

### Input:
```
[[1,3],[2,6],[8,10],[15,18]]
```

### Sorted:
```
[[1,3],[2,6],[8,10],[15,18]]
```

### Output:
```
[[1,6],[8,10],[15,18]]
```

---

## 🔚 Conclusion:
- Brute force is easier to understand but not efficient.
- Optimal approach uses sorting + single pass = cleaner and faster.

