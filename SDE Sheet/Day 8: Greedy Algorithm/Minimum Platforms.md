🚉 Minimum Platforms -- Comprehensive Notes
==========================================

🔗 Problem Link
---------------

[GeeksforGeeks: Minimum Platforms](https://www.geeksforgeeks.org/problems/minimum-platforms-1587115620/1)

* * * * *

📝 Problem Statement
--------------------

You are given the **arrival times (arr[])** and **departure times (dep[])** of trains at a railway station.\
You need to determine the **minimum number of platforms** required such that **no train has to wait**.

-   A platform can only handle **one train at a time**.

-   If a train arrives before the previous one departs, an **extra platform** is needed.

* * * * *

### Example 1

**Input:**

`arr[] = [900, 940, 950, 1100, 1500, 1800]
dep[] = [910, 1200, 1120, 1130, 1900, 2000]`

**Output:**

`3`

**Explanation:**\
Between `9:40 - 12:00`, 3 trains overlap.\
Hence, at least **3 platforms** are needed.

* * * * *

### Example 2

**Input:**

`arr[] = [900, 1235, 1100]
dep[] = [1000, 1240, 1200]`

**Output:**

`1`

**Explanation:**\
No two trains overlap.\
Only **1 platform** is enough.

* * * * *

### Example 3

**Input:**

`arr[] = [1000, 935, 1100]
dep[] = [1200, 1240, 1130]`

**Output:**

`3`

**Explanation:**\
At `11:00 - 11:30`, **3 trains overlap** → requires **3 platforms**.

* * * * *

⚡ Approaches
------------

### 1\. Brute Force Approach

-   For each train, check how many trains overlap with it.

-   Maximum overlap = required platforms.

#### Steps

1.  For each `i` in `arr[]`:

    -   Count number of `j` such that `arr[j] <= dep[i] && dep[j] >= arr[i]`.

2.  Keep track of the maximum overlap.

#### Brute Force Code
```cpp
#include <bits/stdc++.h>
using namespace std;

int findPlatformBrute(vector<int>& arr, vector<int>& dep) {
    int n = arr.size();
    int maxPlat = 1; // at least 1 platform

    for (int i = 0; i < n; i++) {
        int platNeeded = 1;
        for (int j = i + 1; j < n; j++) {
            if ((arr[i] >= arr[j] && arr[i] <= dep[j]) ||
                (arr[j] >= arr[i] && arr[j] <= dep[i])) {
                platNeeded++;
            }
        }
        maxPlat = max(maxPlat, platNeeded);
    }
    return maxPlat;
}
```

#### Complexity

-   **Time:** `O(N^2)`

-   **Space:** `O(1)`\
    👉 Works but too slow for `N = 50000`.

* * * * *

### 2\. Optimized Two-Pointer Approach ✅

We sort both **arrival** and **departure** times.

#### Steps

1.  Sort `arr[]` and `dep[]`.

2.  Use two pointers (`i` for arrivals, `j` for departures).

3.  Traverse events in chronological order:

    -   If `arr[i] <= dep[j]` → a train arrives before previous departs → **need new platform**.

    -   Else `arr[i] > dep[j]` → a train has departed → **free one platform**.

4.  Track maximum platforms required.

* * * * *

#### Optimized Code (Provided)
```cpp
 class Solution {
  public:
    int findPlatform(vector<int>& arr, vector<int>& dep) {
        sort(arr.begin(), arr.end());
        sort(dep.begin(), dep.end());

        int n = arr.size();
        int i = 0, j = 0;
        int platNeeded = 0, maxPlat = 0;

        while (i < n) {
            if (arr[i] <= dep[j]) {
                platNeeded++;
                i++;
            } else {
                platNeeded--;
                j++;
            }
            maxPlat = max(maxPlat, platNeeded);
        }
        return maxPlat;
    }
};
```

* * * * *

⏱ Complexity Analysis
---------------------

### Brute Force

-   **Time:** `O(N^2)`

-   **Space:** `O(1)`

### Optimized Two-Pointer

-   **Time:** `O(N log N)` (due to sorting)

-   **Space:** `O(1)`

👉 Optimal for large input sizes (`N ≤ 50000`).

* * * * *

🧮 Dry Run Example
------------------

Input:

`arr = [900, 940, 950, 1100, 1500, 1800]
dep = [910, 1200, 1120, 1130, 1900, 2000]`

Sorted:

`arr = [900, 940, 950, 1100, 1500, 1800]
dep = [910, 1120, 1130, 1200, 1900, 2000]`

Step-by-step:

| Event | arr[i] | dep[j] | Platforms | Max |
| --- | --- | --- | --- | --- |
| Train arrives | 900 ≤ 910 | +1 | 1 |  |
| Train arrives | 940 ≤ 910 ❌ | -1 (dep) | 0 |  |
| Train arrives | 940 ≤ 1120 | +1 | 1 |  |
| Train arrives | 950 ≤ 1120 | +1 | 2 |  |
| Train arrives | 1100 ≤ 1120 | +1 | 3 |  |
| Train departs | 1500 > 1120 | -1 | 2 |  |
| Train departs | 1500 > 1130 | -1 | 1 |  |
| Train departs | 1500 > 1200 | -1 | 0 |  |
| Train arrives | 1500 ≤ 1900 | +1 | 1 |  |
| Train arrives | 1800 ≤ 1900 | +1 | 2 |  |

✅ **Maximum platforms = 3**

* * * * *

🎥 YouTube Video Link
---------------------

[Minimum Platforms -- Greedy Explanation](https://www.youtube.com/watch?v=AsGzwR_FWok)

* * * * *

✨ Key Takeaways
---------------

-   This problem is a **classic interval scheduling problem**.

-   Brute Force checks all overlaps → `O(N^2)`.

-   Sorting + Two-Pointer Greedy → `O(N log N)` optimal solution.

-   Always sort **arrivals and departures separately** for efficiency.
