
# Pascal's Triangle – Print Full Triangle (Optimal Approach)

## 🧠 Problem Statement
Given a number `n`, print the first `n` rows of **Pascal's Triangle**.

## ✅ Optimal Approach

### 💡 Logic
We use the mathematical property:
> Each element in a row can be derived using the previous element:
```
C(r, k) = C(r, k-1) * (r - k + 1) / k
```
This avoids recomputation using factorials or nested loops.

### 🔢 Code
```cpp
#include<bits/stdc++.h>
using namespace std;

void printPasscalRow(int row){
    int ans = 1;
    cout << ans << " ";
    for(int i = 1; i < row; i++){
        ans = ans * (row - i);
        ans = ans / i;
        cout << ans << " ";
    }
    cout << endl;
}

int main(){
    int n;
    cin >> n;
    for(int i = 1; i <= n; i++){
        printPasscalRow(i);
    }
}
```

### ⏱ Time Complexity
- **O(n²)**: Outer loop runs `n` times, and inner loop runs up to `n` for each row.

### 💾 Space Complexity
- **O(1)**: Constant space used, except for output.

---

## 🔍 Example

Input:
```
5
```

Output:
```
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
```

### ✅ Why it's optimal:
- No recursion
- No factorials
- Avoids using extra 2D arrays
- Linear relation between terms in a row

## 📌 Notes
- Each row `i` starts with `1`.
- Next values are computed in `O(1)` using previous value.

