
# 🔄 Array Rotation (Left Rotation)

## 📌 Problem Statement

Given an array of size `n`, rotate it to the left by `d` positions.

---

## 🚀 Brute Force Approach

### 💡 Logic

- Store the first `d` elements in a temporary array.
- Shift the remaining elements to the left.
- Copy the stored elements to the end of the array.

### 📦 Time Complexity

- **O(n)** — because each element is moved at most once.

### 🧠 Space Complexity

- **O(d)** — uses extra space to temporarily store `d` elements.

### ✅ Code

```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
    int n=10;
    int arr[n]={1,2,3,4,5,6,7,8,9,9};
    int d=27;

    // Reduce unnecessary rotations
    d = d % n;

    int temp[d];

    // Store first d elements
    for(int i = 0; i < d; i++){
        temp[i] = arr[i];
    }

    // Shift remaining elements
    for(int i = d; i < n; i++){
        arr[i - d] = arr[i];
    }

    // Copy back the temp elements
    for(int i = n - d; i < n; i++){
        arr[i] = temp[i - (n - d)];
    }

    // Output rotated array
    for(int i : arr){
        cout << i << ",";
    }
}
```

---

## ⚡ Optimal Approach (Using Reverse Algorithm)

### 💡 Logic

To rotate the array by `k` positions:

1. Reverse the first `k` elements.
2. Reverse the remaining `n-k` elements.
3. Reverse the entire array.

> This approach works in-place without using extra space.

### 📦 Time Complexity

- **O(n)** — 3 reversals of array segments.

### 🧠 Space Complexity

- **O(1)** — no extra space used.

### ✅ Code

```cpp
#include<bits/stdc++.h>
using namespace std;

// Function to reverse a portion of the array
void reverse(int arr[], int low, int high){
    while(low < high){
        int temp = arr[low];
        arr[low] = arr[high];
        arr[high] = temp;
        low++;
        high--;
    }
}

// Function to rotate array to the left by k positions
void rotate(int arr[], int k, int n){
    reverse(arr, 0, k - 1);     // Reverse first k elements
    reverse(arr, k, n - 1);     // Reverse the remaining n-k elements
    reverse(arr, 0, n - 1);     // Reverse the whole array
}

int main(){
    int n, k;
    cout << "Enter K : ";
    cin >> k;
    cout << "Enter Size of Array : ";
    cin >> n;

    int arr[n];
    cout << "Enter Array Elements : ";
    for(int i = 0; i < n; i++){
        cin >> arr[i];
    }

    k = k % n; // Optimize large rotations
    rotate(arr, k, n);

    cout << "Rotated Array: ";
    for(int i : arr){
        cout << i << " ";
    }
}
```

---

## 🔍 Example

**Input**  
`arr = [1, 2, 3, 4, 5]`, `k = 2`

**Output**  
`[3, 4, 5, 1, 2]`

---

## 📝 Summary

| Approach       | Time Complexity | Space Complexity | Notes                     |
|----------------|-----------------|------------------|----------------------------|
| Brute Force    | O(n)            | O(d)             | Uses extra space          |
| Optimal (Rev)  | O(n)            | O(1)             | In-place and efficient    |
