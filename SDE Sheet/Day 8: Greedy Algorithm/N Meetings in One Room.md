📘 N Meetings in One Room -- Comprehensive Notes
===============================================

🔗 Problem Link
---------------

[GeeksforGeeks: N Meetings in One Room](https://www.geeksforgeeks.org/problems/n-meetings-in-one-room-1587115620/1)

* * * * *

📝 Problem Statement
--------------------

You are given `n` meetings with their **start time** and **end time**.\
The goal is to **schedule the maximum number of meetings in one room** such that **no two meetings overlap**.

### Example

Input:

`start[] = {1, 3, 0, 5, 8, 5}
end[]   = {2, 4, 6, 7, 9, 9}`

Output:

`4`

Explanation: Maximum meetings that can be held = **4**\
Possible selection of meetings: `(1,2), (3,4), (5,7), (8,9)`

* * * * *

⚡ Approaches
------------

### 1\. Brute Force Approach

Try all possible subsets of meetings.

#### Steps

1.  Generate all subsets of meetings using recursion/backtracking.

2.  For each subset, check if meetings overlap.

3.  Keep track of the maximum valid subset size.

#### Brute Force Code
```cpp
#include <bits/stdc++.h>
using namespace std;

bool isValid(vector<pair<int,int>>& subset) {
    // Sort by start time
    sort(subset.begin(), subset.end());
    for(int i=1; i<subset.size(); i++) {
        if(subset[i].first < subset[i-1].second) {
            return false; // Overlapping found
        }
    }
    return true;
}

int maxMeetingsBrute(vector<int>& start, vector<int>& end) {
    int n = start.size();
    int maxCount = 0;

    // Generate all subsets (2^n possibilities)
    for(int mask=0; mask < (1<<n); mask++) {
        vector<pair<int,int>> subset;
        for(int i=0; i<n; i++) {
            if(mask & (1<<i)) {
                subset.push_back({start[i], end[i]});
            }
        }
        if(isValid(subset)) {
            maxCount = max(maxCount, (int)subset.size());
        }
    }
    return maxCount;
}
```

#### Complexity

-   Time: **O(2^N * N log N)**

    -   `2^N` subsets

    -   Each check involves sorting (`O(N log N)`)

-   Space: **O(N)**

👉 Clearly infeasible for large inputs, but useful for understanding.

* * * * *

### 2\. Optimized Greedy Approach ✅

Most efficient approach.

#### Key Idea

-   Always **pick the meeting that ends the earliest**.

-   Leaves maximum room for future meetings.

#### Steps

1.  Store meetings as `(end, start)` pairs.

2.  Sort the meetings by **end time**.

3.  Iterate through meetings:

    -   Select a meeting if its `start > last_end_time`.

    -   Update `last_end_time` and increment count.

* * * * *

#### Greedy Code (Provided in Problem)
```cpp
 class Solution {
  public:
    int maxMeetings(vector<int>& start, vector<int>& end) {
        int n = start.size();
        vector<pair<int , int>> meetings;

        // Store as {end, start} pairs
        for(int i=0; i<n; i++){
            meetings.push_back({end[i], start[i]});
        }

        // Sort by end time
        sort(meetings.begin(), meetings.end());

        int count = 0;
        int lastEnd = -1;

        for(int i=0; i<n; i++){
            int s = meetings[i].second;
            int e = meetings[i].first;

            if(s > lastEnd){
                count++;
                lastEnd = e;
            }
        }
        return count;
    }
};
```

* * * * *

⏱ Complexity Analysis
---------------------

### Brute Force

-   **Time:** `O(2^N * N log N)`

-   **Space:** `O(N)`

### Greedy (Optimal)

-   **Time:** `O(N log N)` (due to sorting)

-   **Space:** `O(N)`

* * * * *

🎥 YouTube Video Link
---------------------

[Watch Explanation on Greedy Approach (N Meetings in One Room)](https://www.youtube.com/watch?v=mKfhTotEguk)

* * * * *

✨ Key Takeaways
---------------

-   Brute force checks **all possibilities** but is exponential.

-   Greedy strategy by sorting meetings by **end time** gives the optimal solution in `O(N log N)`.

-   This is a **classic interval scheduling problem**.
