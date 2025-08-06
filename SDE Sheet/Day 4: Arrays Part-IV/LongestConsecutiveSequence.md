
# Longest Consecutive Sequence

## Problem Statement
Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in `O(n)` time.

---

## 💡 Brute Force Approach

### Logic
- For each element, start checking if `x + 1`, `x + 2`, ... exists in the array using a helper function `LS()` (Linear Search).
- Count the length of consecutive sequence for each element.
- Track the maximum.

### Code Snippet
```cpp
bool LS(vector<int>& nums, int t){
    for(int i = 0; i < nums.size(); i++){
        if(nums[i] == t) return true;
    }
    return false;
}

int longestConsecutive(vector<int>& nums) {
    if(nums.size() == 0) return 0;
    int longest = 1;
    for(int i = 0; i < nums.size(); i++){
        int x = nums[i];
        int c = 1;
        while(LS(nums, x + 1)){
            x++;
            c++;
        }
        longest = max(longest, c);
    }
    return longest;
}
```

### Time Complexity: O(n^2)  
### Space Complexity: O(1)

---

## ⚡ Better Approach

### Logic
- Sort the array.
- Traverse and count lengths of consecutive sequences, ignoring duplicates.

### Code Snippet
```cpp
int longestConsecutive(vector<int>& nums) {
    if(nums.size() == 0) return 0;
    sort(nums.begin(), nums.end());
    int lon = 1;
    int c = 0;
    int lastnum = INT_MIN;
    for(int i = 0; i < nums.size(); i++){
        if(nums[i] - 1 == lastnum){
            c++;
            lastnum = nums[i];
        } else if(lastnum != nums[i]) {
            c = 1;
            lastnum = nums[i];
        }
        lon = max(lon, c);
    }
    return lon;
}
```

### Time Complexity: O(n log n)  
### Space Complexity: O(1) (excluding sort space)

---

## 🚀 Optimal Approach

### Logic
- Use a `HashSet` to store all unique elements.
- For every element, check if it's the **start** of a sequence (i.e., `x-1` not in set).
- If yes, start counting the sequence length.
- Track the longest sequence found.

### Code Snippet
```cpp
int longestConsecutive(vector<int>& nums) {
    int n = nums.size();
    if(n == 0) return 0;
    int longest = 1;
    unordered_set<int> st;
    for(int i = 0; i < n; i++){
        st.insert(nums[i]);
    }

    for(auto it : st){
        if(st.find(it - 1) == st.end()){
            int cnt = 1;
            int x = it;
            while(st.find(x + 1) != st.end()){
                x++;
                cnt++;
            }
            longest = max(cnt, longest);
        }
    }
    return longest;
}
```

### Time Complexity: O(n)  
### Space Complexity: O(n)

---

## ✅ Example

### Input:
```cpp
nums = [100, 4, 200, 1, 3, 2]
```

### Output:
```
4
```

### Explanation:
The longest consecutive elements sequence is [1, 2, 3, 4].

---

## Summary Table

| Approach       | Time Complexity | Space Complexity |
|----------------|------------------|-------------------|
| Brute Force    | O(n^2)           | O(1)              |
| Better (Sort)  | O(n log n)       | O(1)              |
| Optimal (Set)  | O(n)             | O(n)              |
