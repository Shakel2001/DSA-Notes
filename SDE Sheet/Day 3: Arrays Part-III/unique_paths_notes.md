
# Unique Paths - Leetcode

## Problem:
A robot is located at the top-left corner of an `m x n` grid. The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid.

---

## 1. Memoization (Top-down DP)

```cpp
class Solution {
public:
    int countPath(int i, int j, int m, int n, vector<vector<int>> &dp){
        if(i==m-1&& j==n-1)return 1;
        if(i>=m||j>=n)return 0;
        if(dp[i][j]!=-1)return dp[i][j];
        else return dp[i][j]= countPath(i+1,j,m,n,dp)+countPath(i,j+1,m,n,dp);
    }
    int uniquePaths(int m, int n) {
        vector<vector<int>> dp(m, vector<int>(n, -1));
        return countPath(0, 0, m, n, dp);
    }
};
```

**Time Complexity:** O(m * n)  
**Space Complexity:** O(m * n) (due to recursion stack + memo table)

---

## 2. Recursion (Without Memoization)

```cpp
class Solution {
public:
    int countPath(int i, int j, int m, int n){
        if(i==m-1&& j==n-1)return 1;
        if(i>=m||j>=n)return 0;
        else return countPath(i+1,j,m,n)+countPath(i,j+1,m,n);
    }
    int uniquePaths(int m, int n) {
        return countPath(0, 0, m, n);
    }
};
```

**Time Complexity:** O(2^(m+n))  
**Space Complexity:** O(m + n) (due to recursion stack)

---

## 3. Combinatorics (Optimal Approach)

```cpp
class Solution {
public:
    int uniquePaths(int m, int n) {
        int N= m+n-2;
        int C=n-1;
        double res=1;
        for(int i=0; i<C; i++){
            res=res*(N-i);
            res=res/(i+1);
        }
        return (int)(res+0.5);// rounding to nearest integer to avoid precision errors
    }
};
```

**Time Complexity:** O(min(m, n))  
**Space Complexity:** O(1)

---

## Summary

| Approach         | Time Complexity | Space Complexity | Description                |
|------------------|------------------|------------------|----------------------------|
| Memoization      | O(m * n)         | O(m * n)         | Top-down with memoization |
| Recursion        | O(2^(m+n))       | O(m + n)         | Brute-force recursive     |
| Combinatorics    | O(min(m, n))     | O(1)             | Optimal using math        |
