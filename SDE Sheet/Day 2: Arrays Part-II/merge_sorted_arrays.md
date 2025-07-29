
# Merging Two Sorted Arrays

This note covers three approaches to merge two sorted arrays: Brute Force, Optimal (Two Pointer + Sorting), and the Shell Method.

---

## 🔹 Problem Statement
Given two sorted arrays, merge them into a single sorted array **without using extra space** (for optimal and shell methods).

---

## 🧠 Brute Force Approach

### ✅ Logic:
- Use an auxiliary array to store the merged elements.
- Traverse both arrays using two pointers.
- Compare elements and copy the smaller one to the auxiliary array.
- After one array is exhausted, copy remaining elements of the other.

### 🧾 Code:
```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
    int n = 5, m = 4;
    int arr1[n] = {0, 1, 3, 4, 5};
    int arr2[m] = {0, 0, 6, 8};
    int arr3[n + m];

    int left = 0, right = 0, idx = 0;

    while (left < n && right < m) {
        if (arr1[left] <= arr2[right]) {
            arr3[idx++] = arr1[left++];
        } else {
            arr3[idx++] = arr2[right++];
        }
    }
    while (left < n) arr3[idx++] = arr1[left++];
    while (right < m) arr3[idx++] = arr2[right++];

    for (int i = 0; i < n + m; i++) cout << arr3[i] << " ";
}
```

### ⏱️ Time Complexity:
O(n + m)

### 📦 Space Complexity:
O(n + m) – extra space used

---

## 🧠 Optimal Approach (Two Pointers + Sorting)

### ✅ Logic:
- Start from end of `arr1` and beginning of `arr2`.
- Swap if `arr1[i] > arr2[j]` and move both pointers.
- Finally, sort both arrays.

### 🧾 Code:
```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
    int n = 5, m = 4;
    int arr1[n] = {1, 2, 3, 4, 5};
    int arr2[m] = {3, 4, 6, 9};

    int left = n - 1, right = 0;
    while (left >= 0 && right < m) {
        if (arr1[left] > arr2[right]) {
            swap(arr1[left--], arr2[right++]);
        } else {
            break;
        }
    }
    sort(arr1, arr1 + n);
    sort(arr2, arr2 + m);

    for (int i : arr1) cout << i << " ";
    for (int i : arr2) cout << i << " ";
}
```

### ⏱️ Time Complexity:
O((n + m) log(n + m))

### 📦 Space Complexity:
O(1) – in-place merge

---

## 🧠 Shell Method (Gap Method)

### ✅ Logic:
- Use a shrinking gap and compare elements at a distance `gap`.
- If out of order, swap.
- Continue reducing the gap until it becomes 0.

### 🧾 Code:
```cpp
#include <bits/stdc++.h>
using namespace std;

void merge(int arr1[], int arr2[], int n, int m){
    int gap = ceil((float)(n + m) / 2);
    while (gap > 0) {
        int i = 0, j = gap;
        while (j < (n + m)) {
            int a = (i < n) ? arr1[i] : arr2[i - n];
            int b = (j < n) ? arr1[j] : arr2[j - n];
            if (a > b) {
                if (i < n && j < n)
                    swap(arr1[i], arr1[j]);
                else if (i < n && j >= n)
                    swap(arr1[i], arr2[j - n]);
                else
                    swap(arr2[i - n], arr2[j - n]);
            }
            i++, j++;
        }
        gap = (gap == 1) ? 0 : ceil((float)gap / 2);
    }
}

int main(){
    int arr1[] = {1, 3, 5, 7};
    int arr2[] = {0, 2, 6, 8, 9};
    int n = 4, m = 5;
    merge(arr1, arr2, n, m);
    for (int i = 0; i < n; i++) cout << arr1[i] << " ";
    for (int i = 0; i < m; i++) cout << arr2[i] << " ";
}
```

### ⏱️ Time Complexity:
O((n + m) * log(n + m))

### 📦 Space Complexity:
O(1) – in-place

---

## 📊 Comparison Table

| Approach      | Time Complexity     | Space Complexity | Extra Space Used |
|---------------|---------------------|------------------|------------------|
| Brute Force   | O(n + m)            | O(n + m)         | ✅ Yes           |
| Optimal       | O((n + m) log(n + m))| O(1)             | ❌ No            |
| Shell Method  | O((n + m) log(n + m))| O(1)             | ❌ No            |

---

## ✅ Recommendation
Use **Shell Method** for **in-place merge** when space is a concern. Brute force is fine for simple problems where extra space is allowed.
