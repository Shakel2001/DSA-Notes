## Two-Sum Problem: Brute Force vs Optimal Solution
### Problem Statement
Given an array of integers and a target value, find two indices such that the elements at those positions sum to the target. Each input has exactly one solution, and you may not use the same element twice.
### Brute Force Solution
#### Code
```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
    vector<int> a = {1,12,3,6,7,12};
    int k = 19;
    int n = a.size();
    for(int i = 0; i < n; i++){
        for(int j = i + 1; j < n; j++){
            if(a[i] + a[j] == k){
                cout << i << "," << j << " yes";
            }
            break; // This break is misplaced and causes the inner loop to run only once per i
        }
    }
}
```
#### Logic
- The brute force approach is intended to check every possible pair of elements in the array.
- The outer loop runs from the first element to the last.
- The inner loop runs from the next element (to avoid using the same element twice) to the end of the array.
- For each pair (i, j), it checks if the sum equals the target. If yes, it prints the indices.
#### Issues in the Provided Code
1. **Premature Break**: The `break` statement inside the inner loop (but outside the if condition) causes the inner loop to break after the first iteration regardless of whether the pair is found or not. This means that for each `i`, only `j = i+1` is checked. Therefore, the code only checks adjacent pairs and misses any non-adjacent pairs that might add up to the target.
2. **Incorrect Pairs**: The code does not check all possible pairs. For example, in the given array, the solution should be the pair (1, 5) because a[1]=12 and a[5]=12 (12+12=24, but wait, the target is 19) — actually, the target is 19. The correct pair in the given array for target 19 is 12 at index 1 and 7 at index 4 (12+7=19). However, the code would only check (0,1): 1+12=13, (1,2): 12+3=15, (2,3): 3+6=9, (3,4): 6+7=13, (4,5): 7+12=19 -> but because of the break, the inner loop for i=4 would run only j=5? Actually, the break is inside the inner loop but outside the if. So for each i, the inner loop runs one iteration (j=i+1) and then breaks. So the code would check only the adjacent pairs.
#### Corrected Brute Force Code
To fix the brute force, we should remove the `break` so that the inner loop runs for all j from i+1 to n-1.
```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
    vector<int> a = {1,12,3,6,7,12};
    int k = 19;
    int n = a.size();
    for(int i = 0; i < n; i++){
        for(int j = i + 1; j < n; j++){
            if(a[i] + a[j] == k){
                cout << i << "," << j << " yes" << endl;
            }
        }
    }
}
```
#### Time Complexity of Corrected Brute Force
- **Time Complexity**: O(n²) - because for each element, we check every other element. There are n*(n-1)/2 pairs, which is O(n²).
- **Space Complexity**: O(1) - we are not using any extra space.
### Optimal Solution
#### Code
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> mp; // or unordered_map for better average time
        for(int i = 0; i < nums.size(); i++) {
            int complement = target - nums[i];
            if(mp.find(complement) != mp.end()) {
                return {i, mp[complement]};
            }
            mp[nums[i]] = i;
        }
        return {-1, -1};
    }
};
```
#### Logic
- We use a hash map (or dictionary) to store the value and its index as we iterate through the array.
- For each element `nums[i]`, we calculate the complement (i.e., `target - nums[i]`).
- We check if the complement is already in the map. If it is, that means we have found the two numbers that add up to the target. We return the current index and the index stored in the map for the complement.
- If the complement is not found, we add the current element and its index to the map and continue.
#### Key Points
- **Single Pass**: The solution is done in a single pass through the array.
- **Avoids Duplicate Use**: By inserting the element after checking, we ensure that we do not use the same element twice. For example, if the complement were the same element, we haven't inserted it in the map at the time of checking, so it won't be found.
#### Time Complexity
- **Using `map` (std::map)**: O(n log n) because each insertion and lookup in a map (which is typically implemented as a red-black tree) takes O(log n) time, and we do it for each element.
- **Using `unordered_map` (std::unordered_map)**: O(n) on average, because insertions and lookups in a hash table are O(1) on average. However, worst-case can be O(n) per operation, leading to O(n²) worst-case, but this is rare.
#### Space Complexity
- O(n) - for storing the map which in the worst case may store all elements.
### Comparison
| Aspect          | Brute Force (Corrected) | Optimal Solution (with unordered_map) |
|-----------------|-------------------------|---------------------------------------|
| Time Complexity | O(n²)                   | O(n) average, O(n²) worst-case        |
| Space Complexity| O(1)                    | O(n)                                  |
| Approach        | Check every pair        | Use hash table for lookups            |
| Efficiency      | Inefficient for large n | Efficient for large n                 |
### Conclusion
- For small arrays, the brute force method is acceptable due to its simplicity and minimal memory usage.
- For larger arrays, the optimal solution using a hash map is much faster, trading space for time efficiency.
