
# Length of Longest Substring Without Repeating Characters

## Problem Statement

Given a string `s`, find the length of the longest substring without repeating characters.

---

## Code Explanation

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        vector<int> mpp(256, -1); // stores the last seen index of each character (ASCII range: 0-255)

        int left = 0; // start of the window
        int right = 0; // end of the window
        int n = s.size(); // length of the string
        int len = 0; // stores the maximum length of substring found

        while (right < n) {
            // If character has already been seen and is inside the current window
            if (mpp[s[right]] != -1)
                left = max(mpp[s[right]] + 1, left); // move left to one past the last index of current char

            mpp[s[right]] = right; // update the index of the current character
            len = max(len, right - left + 1); // update max length
            right++;
        }
        return len;
    }
};
```

---

## Example Walkthrough

### Input: `"abcabcbb"`

1. Window: `a` → len = 1  
2. Window: `ab` → len = 2  
3. Window: `abc` → len = 3  
4. Char `a` repeated → move `left` to index after last `a` → new window: `bca`  
5. Continue similarly... max length remains `3`.

### Input: `"bbbbb"`

1. First `b` → len = 1  
2. Repeated `b` → move `left` to next index each time → max length = 1

### Input: `"pwwkew"`

1. `p` → len = 1  
2. `pw` → len = 2  
3. `pww` → move `left` after first `w`  
4. `wk` → len = 2  
5. `wke` → len = 3  
6. `wkew` → `w` repeated again → final max len = 3

---

## Time and Space Complexity

- **Time Complexity:** O(n), where n is the length of the string. Each character is visited at most twice.
- **Space Complexity:** O(256) = O(1), fixed size hash map for ASCII characters.

---

## Key Concepts

- **Sliding Window:** Move the `right` pointer to expand the window, and `left` to shrink it when repeating characters are found.
- **Hash Map/Array:** To store the last seen position of characters.
