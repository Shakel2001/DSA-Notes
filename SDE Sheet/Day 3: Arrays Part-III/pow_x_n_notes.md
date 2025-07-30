
# ⚡ Implement `pow(x, n)` (x raised to the power n)

## 🧩 Problem Statement

Implement the function `double myPow(double x, int n)` which calculates `x^n` (x raised to the power n), where:
- `x` is a double-precision floating-point number
- `n` is a 32-bit signed integer

---

## 🔁 Brute Force Approach

```cpp
class Solution {
public:
    double myPow(double x, int n) {
        double ans = 1;
        int t = n;

        if(n < 0) {
            n = -1 * n;
        }

        while(n > 0) {
            ans = ans * x;
            n--;
        }

        if(t < 0) {
            return 1 / ans;
        }

        return ans;
    }
};
```

### 🔍 Logic:
- Multiply `x` to `ans` `n` times.
- If `n` is negative, compute reciprocal of the result.

### ⏱️ Time Complexity:
- **O(n)**

### 📦 Space Complexity:
- **O(1)**

### ⚠️ Limitations:
- Will **TLE** for large values of `n` like `10^9`.
- Does **not** handle integer overflow for `n = INT_MIN` in C++.

---

## ⚡ Optimal Approach: Binary Exponentiation

```cpp
class Solution {
public:
    double myPow(double x, int n) {
        if(n == 0) return 1.0;
        if(x == 1) return 1.0;
        if(x == 0) return 0.0;
        if(x == -1 && n % 2 == 0) return 1.0;
        if(x == -1 && n % 2 != 0) return -1.0;

        long binaryForm = n;
        if(binaryForm < 0) {
            binaryForm = -1 * binaryForm;
        }

        double ans = 1.0;
        while(binaryForm > 0) {
            if(binaryForm % 2 == 1) {
                ans *= x;
            }
            x *= x;
            binaryForm /= 2;
        }

        if(n < 0) return 1 / ans;
        return ans;
    }
};
```

### 🔍 Logic:
- Use **Binary Exponentiation**:
  - Square the base.
  - Halve the exponent.
  - Multiply the result only when exponent bit is `1`.

### ✅ Why `long` for `n`?
- `INT_MIN` = `-2^31` → `abs(INT_MIN)` overflows for 32-bit signed `int`.

### ⏱️ Time Complexity:
- **O(log n)**

### 📦 Space Complexity:
- **O(1)**

---

## 🔚 Conclusion

| Approach       | Time Complexity | Space Complexity | Notes                        |
|----------------|------------------|-------------------|-------------------------------|
| Brute Force     | O(n)             | O(1)              | Simple but slow               |
| Binary Exponentiation ✅ | O(log n)         | O(1)              | Efficient and preferred       |

✅ **Use Binary Exponentiation for optimal performance on large exponents.**
