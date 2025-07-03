# 🧠 QuickSort Algorithm in C++

This repository contains a clean and correct implementation of the **QuickSort** algorithm using the **Hoare partition scheme** in C++.

---

## 📋 Description

QuickSort is a **divide-and-conquer** sorting algorithm. It works by selecting a `pivot` element and partitioning the array into two sub-arrays:
- Elements less than or equal to the pivot.
- Elements greater than the pivot.

The process is repeated recursively for each sub-array until the whole array is sorted.

---

## 🧩 Key Concepts

- **Time Complexity**:
  - Average case: `O(n log n)`
  - Worst case: `O(n^2)` (when pivot selection is poor)
- **Space Complexity**: `O(log n)` due to recursive stack

---

## ✅ Features of this Implementation

- Uses **Hoare’s Partitioning Scheme**
- Avoids infinite recursion
- Handles edge cases
- Modular structure for clarity

---

## 📌 Code

```cpp
class Solution {
public:
    // Partition function using Hoare's partitioning
    int partition(vector<int>& arr, int low, int high) {
        int pivot = arr[low];
        int i = low;
        int j = high;

        while (i < j) {
            while (arr[i] <= pivot && i <= high - 1) {
                i++;
            }
            while (arr[j] > pivot && j >= low) {
                j--;
            }
            if (i < j) {
                swap(arr[i], arr[j]);
            }
        }

        swap(arr[low], arr[j]);
        return j;
    }

    // Recursive QuickSort function
    void qS(vector<int>& arr, int low, int high) {
        if (low < high) {
            int ptI = partition(arr, low, high);
            qS(arr, low, ptI - 1);
            qS(arr, ptI + 1, high);
        }
    }

    // Main QuickSort wrapper function
    vector<int> quickSort(vector<int>& nums) {
        qS(nums, 0, nums.size() - 1);
        return nums;
    }
};
