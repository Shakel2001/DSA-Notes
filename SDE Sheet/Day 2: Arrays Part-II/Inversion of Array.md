🔄 Count Inversions in an Array
===============================

An **inversion** in an array is a pair of elements `(i, j)` such that `i < j` and `arr[i] > arr[j]`.

* * * * *

✅ Problem Statement
-------------------

Given an array of `n` integers, count the number of inversion pairs in the array.

**Example:**

txt

CopyEdit

`Input: arr = [5, 3, 2, 4, 1]
Output: 8`

Inversions: (5,3), (5,2), (5,4), (5,1), (3,2), (3,1), (2,1), (4,1)

* * * * *

✅ Approach 1: Brute Force
-------------------------

### 🔍 Logic

-   Traverse all pairs `(i, j)` with `i < j`.

-   For every such pair, check if `arr[i] > arr[j]`. If yes, it's an inversion.

### 📦 Code

```cpp

#include <bits/stdc++.h>
long long getInversions(long long *arr, int n){
    long long count = 0;
    for(int i = 0; i < n; i++){
        for(int j = i + 1; j < n; j++){
            if(arr[i] > arr[j]){
                count++;
            }
        }
    }
    return count;
}
```

### 🧮 Time Complexity

-   **O(n²)** -- Two nested loops.

### 🧠 Space Complexity

-   **O(1)** -- No extra space used.

* * * * *

✅ Approach 2: Optimized Using Merge Sort
----------------------------------------

### 🔍 Logic

Use the **merge sort** algorithm to sort the array, and during the merge step:

-   Count how many elements in the right subarray are smaller than the current element in the left subarray.

-   These elements form inversion pairs.

### 📦 Code

```cpp

#include <bits/stdc++.h>
using namespace std;

long long merge(long long *arr, int low, int mid, int high) {
    long long temp[high - low + 1];
    int left = low;
    int right = mid + 1;
    int k = 0;
    long long inv_count = 0;

    while (left <= mid && right <= high) {
        if (arr[left] <= arr[right]) {
            temp[k++] = arr[left++];
        } else {
            temp[k++] = arr[right++];
            inv_count += (mid - left + 1); // Elements from left to mid are all greater
        }
    }

    while (left <= mid)
        temp[k++] = arr[left++];
    while (right <= high)
        temp[k++] = arr[right++];

    for (int i = low; i <= high; i++)
        arr[i] = temp[i - low];

    return inv_count;
}

long long mergeSort(long long *arr, int low, int high) {
    long long inv_count = 0;
    if (low < high) {
        int mid = (low + high) / 2;
        inv_count += mergeSort(arr, low, mid);
        inv_count += mergeSort(arr, mid + 1, high);
        inv_count += merge(arr, low, mid, high);
    }
    return inv_count;
}

long long getInversions(long long *arr, int n) {
    return mergeSort(arr, 0, n - 1);
}`
```

### 🧮 Time Complexity

-   **O(n log n)** -- Efficient divide and conquer sorting.

### 🧠 Space Complexity

-   **O(n)** -- For temporary array during merging.

* * * * *

🏁 Final Comparison
-------------------

| Approach | Time Complexity | Space Complexity | Remarks |
| --- | --- | --- | --- |
| Brute Force | O(n²) | O(1) | Simple but slow for large `n` |
| Merge Sort | O(n log n) | O(n) | Efficient and preferred for large `n` |
