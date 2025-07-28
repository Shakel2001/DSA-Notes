
# Combinatorics: Efficient Computation of nCr

## 🧠 Problem Statement
Calculate **nCr** (number of combinations):
\[
nCr = frac{n!}/{r!(n - r)!}
\]
This represents the number of ways to choose `r` items from `n` items without considering the order.

---

## 🔍 Brute Force Way (Not Recommended)
Using direct factorial computation:
```cpp
long long factorial(int n) {
    long long res = 1;
    for (int i = 2; i <= n; i++) res *= i;
    return res;
}

long long nCr(int n, int r) {
    return factorial(n) / (factorial(r) * factorial(n - r));
}
```

### ❌ Issues:
- Risk of **overflow** for large `n`
- **Inefficient** (Time: O(n))

---

## ✅ Efficient Approach
### 📘 Code
```cpp
#include <bits/stdc++.h>
using namespace std;

void NcR(int n, int r) {
    long long res = 1;
    for (int i = 0; i < r; i++) {
        res = res * (n - i);   // Multiply numerator
        res = res / (i + 1);   // Divide denominator
    }
    cout << res;
}

int main() {
    int n, r;
    cin >> n >> r;
    NcR(n, r);
}
```

---

## 🔍 Logic
Use the formula:
\[
nCr = \frac{n \cdot (n-1) \cdot (n-2) \dots (n - r + 1)}{1 \cdot 2 \cdot 3 \dots r}
\]

We multiply top `r` values and divide by bottom `r` values one-by-one to avoid overflow and reduce computation.

---

## 📊 Example
### Input
```
n = 5
r = 2
```

### Calculation
```
res = 1
res = res * (5 - 0) / (0 + 1) = 5 / 1 = 5
res = res * (5 - 1) / (1 + 1) = 4 / 2 = 10
```

### Output
```
10
```

---

## ⚙️ Time and Space Complexity
| Metric              | Value  |
|---------------------|--------|
| Time Complexity     | O(r)   |
| Space Complexity    | O(1)   |

---

## ✅ Advantages
- Avoids overflow
- Faster than factorial-based solution
- Works well for most values of `n`, `r`

---

## ⚠️ Edge Case Considerations
- If `r > n`: return 0 (no combinations possible)
- If `r == 0` or `r == n`: return 1

Add these checks in the function if needed.

---

## 🚀 Summary
This method is optimal for calculating combinations (nCr) efficiently and accurately. Commonly used in competitive programming and combinatorics problems.

Happy Coding! 🎯
