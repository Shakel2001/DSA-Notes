
# Printing All Subarrays of an Array (Brute Force)

## 🔍 Problem Statement
Given an array of integers, print all possible subarrays and count their total number.

---

## 🧠 Approach: Brute Force

We use three nested loops:
- The outer loop picks the starting index `i`.
- The middle loop picks the ending index `j`.
- The innermost loop prints elements from index `i` to `j`.

---

## 📦 Code (C++)

```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
    int arr[8] = {-2, -3, 4, -1, -2, 1, 5, -3};
    int c = 0;
    for(int i = 0; i < 8; i++){
        for(int j = i; j < 8; j++){
            for(int k = i; k <= j; k++){
                cout << arr[k] << " ";
            }
            c++;
            cout << "\n";
        }
    }
    cout << "Number of subarrays: " << c << "\n";
}
```

---

## 🧮 Example Output

For input: `{-2, -3, 4, -1, -2, 1, 5, -3}`,  
The program prints all **28** possible subarrays (since 8 elements → n(n+1)/2 = 36).

---

## 🕒 Time and Space Complexity

- **Time Complexity**: O(n³)
  - 2 loops for selecting subarrays (O(n²))
  - 1 loop for printing each subarray (up to O(n))
- **Space Complexity**: O(1) (excluding output)

---

## ⚠️ Edge Cases

- Empty array → No subarrays
- Array with one element → One subarray

---

## ✅ Conclusion

This approach is simple but inefficient for large arrays. For better performance, use optimized methods for specific tasks like max subarray sum (Kadane’s Algorithm).
