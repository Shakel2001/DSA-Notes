🧠 Find Missing and Repeating Numbers
=====================================

Given an array of size `n` containing numbers from `1` to `n`, one number is **missing** and one number is **repeating**. Find both.

* * * * *

✅ Problem Statement
-------------------

You're given a vector `nums` of size `n` containing numbers from 1 to `n`. Exactly one number is missing and one number is repeated.\
Return a vector of two elements: `{missing, repeating}`.

* * * * *

✅ Approach 1: Brute Force (Using Frequency Array)
-------------------------------------------------

### 🔍 Logic

-   Create a temporary array `temp` of size `n+1` initialized to 0.

-   Count the frequency of each number.

-   If frequency is 0 → it's the **missing** number.

-   If frequency is 2 → it's the **repeating** number.

### 📦 Code

```cpp

class Solution {
public:
    vector<int> findMissingRepeatingNumbers(vector<int> nums) {
        vector<int>ans;
        int n = nums.size();
        vector<int>temp(n+1,0);
        for(int i: nums){
            temp[i]++;
        }
        int missing = -1, repeating = -1;
        for(int i=1; i<=n; i++){
            if(temp[i]==0){
                missing=i;
            }
            if(temp[i]==2){
                repeating=i;
            }
        }
        ans.push_back(missing);
        ans.push_back(repeating);
        return ans;
    }
};
```

### 🧮 Time Complexity

-   **O(n)** -- one loop to fill `temp`, one loop to find missing/repeating.

### 🧠 Space Complexity

-   **O(n)** -- uses an auxiliary array of size `n+1`.

* * * * *

✅ Approach 2: Optimal Using Math Formulas
-----------------------------------------

### 🔍 Logic

Let:

-   `S` = Sum of elements in the array

-   `SN` = Sum of first `n` natural numbers = `n(n+1)/2`

-   `S2` = Sum of squares of elements in the array

-   `S2N` = Sum of squares of first `n` numbers = `n(n+1)(2n+1)/6`

Let:

-   `x = Repeating number`

-   `y = Missing number`

Then,

-   `S - SN = x - y` → val1

-   `S2 - S2N = x² - y² = (x - y)(x + y)` → val2\
    So,

-   `val2 / val1 = x + y`\
    Now solve:

-   `x + y = val2 / val1`

-   `x - y = val1`

From this, solve for x and y.

### 📦 Code

```cpp

#include<bits/stdc++.h>
using namespace std;

int main(){
    vector<int>arr = {1, 5, 3, 4, 5};
    vector<int>ans;
    long long n = arr.size();

    long long SN = (n * (n + 1)) / 2;
    long long S2N = (n * (n + 1) * (2 * n + 1)) / 6;

    long long S = 0;
    long long S2 = 0;
    for (int i : arr) {
        S += i;
        S2 += (long long)i * (long long)i;
    }

    long long val1 = S - SN;       // x - y
    long long val2 = S2 - S2N;     // x^2 - y^2
    val2 = val2 / val1;            // x + y

    int x = (val1 + val2) / 2;
    int y = x - val1;

    cout << "Repeating: " << x << " Missing: " << y << endl;
}
```

### 🧮 Time Complexity

-   **O(n)** -- one loop to compute sum and sum of squares.

### 🧠 Space Complexity

-   **O(1)** -- only variables used, no extra arrays.

* * * * *

✅ Approach 3: Optimal Using XOR(I'm Not Sure)
-------------------------------

### 🔍 Logic

1.  XOR all array elements and numbers from `1` to `n`.

2.  The result will be `x ^ y` (repeating ^ missing).

3.  Find the **rightmost set bit** to differentiate x and y.

4.  Divide numbers into two sets based on that bit and XOR separately.

5.  One result is `x`, the other is `y`.

6.  Finally, scan the array to find which one is repeating.

### 📦 Code

```cpp


#include<bits/stdc++.h>
using namespace std;

int main(){
    vector<int> arr = {1, 3, 4, 5, 5};
    int n = arr.size();
    int xor1 = 0;

    for(int i=0; i<n; i++){
        xor1 ^= arr[i];
    }
    for(int i=1; i<=n; i++){
        xor1 ^= i;
    }

    int rightmostSetBit = xor1 & ~(xor1 - 1);

    int x = 0, y = 0;
    for(int i=0; i<n; i++){
        if(arr[i] & rightmostSetBit)
            x ^= arr[i];
        else
            y ^= arr[i];
    }
    for(int i=1; i<=n; i++){
        if(i & rightmostSetBit)
            x ^= i;
        else
            y ^= i;
    }

    // Determine which is repeating
    int repeating = -1, missing = -1;
    for(int i=0; i<n; i++){
        if(arr[i] == x){
            repeating = x;
            missing = y;
            break;
        } else if(arr[i] == y){
            repeating = y;
            missing = x;
            break;
        }
    }

    cout << "Repeating: " << repeating << ", Missing: " << missing << endl;
}
```

### 🧮 Time Complexity

-   **O(n)** -- three loops: one for XOR, one for grouping, one for check.

### 🧠 Space Complexity

-   **O(1)** -- no extra array used.

* * * * *

🏁 Final Summary
----------------

| Approach | Time Complexity | Space Complexity | Notes |
| --- | --- | --- | --- |
| Brute Force | O(n) | O(n) | Uses extra space for frequency array |
| Math Formula | O(n) | O(1) | Uses sum and sum of squares |
| XOR Trick | O(n) | O(1) | Bit manipulation and clever use of XOR |
