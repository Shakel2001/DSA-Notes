# Count Subarrays with XOR Equal to K

## Problem Statement
Given an array `arr` and an integer `k`, count the number of subarrays whose XOR is equal to `k`.

---

## 💡 Brute Force Approach

### Logic
- Use three nested loops:
  1. Outer loop to fix the start of the subarray.
  2. Middle loop to fix the end.
  3. Inner loop to calculate XOR of the subarray.
- Compare the result with `k`.

### Time Complexity: O(N³)  
### Space Complexity: O(1)

---

## ⚡ Better Approach (Prefix XOR without map)

### Logic
- Fix a start index `i`.
- Iterate through the array from `i` to `n`, keep calculating XOR and comparing it to `k`.

### Code Snippet
```cpp
long subarrayXor(vector<int> &arr, int k) {
    long c = 0;
    int n = arr.size();
    for(int i = 0; i < n; i++) {
        long XoR = 0;
        for(int j = i; j < n; j++) {
            XoR = XoR ^ arr[j];
            if(XoR == k) {
                c++;
            }
        }
    }
    return c;
}
```
### Time Complexity: O(N²)

### Space Complexity: O(1)

* * * * *

🚀 Optimal Approach (Prefix XOR + Hash Map)
-------------------------------------------

### Logic

-   Use a hash map to store the count of prefix XORs.

-   Let `xr` be the current prefix XOR at index `i`.

-   We want `xr ^ k = x` ⇒ `x = xr ^ k`. If `x` exists in the map, it means there's a prefix which when removed from the current prefix gives XOR `k`.

### Code Snippet

```cpp

long subarrayXor(vector<int> &arr, int k) {
    long xr = 0;
    map<int, int> mpp;
    mpp[xr]++;
    long cnt = 0;

    for(int i = 0; i < arr.size(); i++) {
        xr = xr ^ arr[i];
        int x = xr ^ k;
        cnt += mpp[x];
        mpp[xr]++;
    }
    return cnt;
}
```

### Time Complexity: O(N)

### Space Complexity: O(N)

* * * * *

✅ Example
---------

### Input:

```cpp
arr = [4, 2, 2, 6, 4]
k = 6
```

### Output:

`4`

### Explanation:

The subarrays with XOR = 6 are:

-   [4, 2]

-   [2, 2, 6]

-   [6]

-   [4, 2, 2, 6]

* * * * *

Summary Table
-------------

| Approach | Time Complexity | Space Complexity | Notes |
| --- | --- | --- | --- |
| Brute Force | O(N³) | O(1) | Triple loop |
| Better | O(N²) | O(1) | Prefix XOR in nested loop |
| Optimal | O(N) | O(N) | Prefix XOR + Hash Map |
