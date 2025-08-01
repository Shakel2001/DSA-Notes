# 🧠 Three Sum Problem - Notes

## 📝 Problem Statement:
Given an array `nums` of `n` integers, return all unique triplets `[nums[i], nums[j], nums[k]]` such that `i ≠ j`, `j ≠ k`, and `i ≠ k`, and `nums[i] + nums[j] + nums[k] == 0`.

---

## 💡 Approach 1: Brute Force

### 🔍 Logic:
- Use three nested loops to check all combinations of three elements.
- If the sum is 0, store the sorted triplet in a `set` to avoid duplicates.

### 🧾 Code:
```cpp
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        int n= nums.size();
        set<vector<int>>st;
        for(int i=0; i<n; i++){
            for(int j=i+1; j<n; j++){
                for(int k=j+1; k<n; k++){
                    if(nums[i]+nums[j]+nums[k]==0){
                        vector<int>temp{nums[i],nums[j],nums[k]};
                        sort(temp.begin(),temp.end());
                        st.insert(temp);
                    }
                }
            }
        }
        return vector<vector<int>>(st.begin(),st.end());
    }
};
```

### ⏱ Time Complexity:
- **O(N³ × logK)** where `K` is the number of unique triplets (due to sorting & set insertion).

### 🧠 Space Complexity:
- **O(K)** for storing triplets in set.

---

## 💡 Approach 2: Better (Using Hash Set)

### 🔍 Logic:
- Fix one element and find the other two using hashing (`Two Sum` variant).
- Store result in set to avoid duplicates.

### 🧾 Code:
```cpp
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        int n= nums.size();
        set<vector<int>>st;
        for(int i=0; i<n; i++){
            set<long long>hashst;
            for(int j=i+1; j<n; j++){
                long long sum=nums[i]+nums[j];
                long long forth=-sum;
                if(hashst.find(forth)!=hashst.end()){
                    vector<int>temp{nums[i],nums[j],(int)forth};
                    sort(temp.begin(),temp.end());
                    st.insert(temp);
                }
                hashst.insert(nums[j]);
            }
        }
        return vector<vector<int>>(st.begin(),st.end());
    }
};
```

### ⏱ Time Complexity:
- **O(N² × logK)** — two nested loops and `logK` for set insertions.

### 🧠 Space Complexity:
- **O(N) + O(K)** — hash set and result set.

---

## 💡 Approach 3: Optimal (Two Pointers)

### 🔍 Logic:
- Sort the array.
- Fix the first element and use two pointers to find other two such that their sum is zero.
- Skip duplicates carefully to avoid repeating triplets.

### 🧾 Code:
```cpp
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        int n=nums.size();
        vector<vector<int>>ans;
        sort(nums.begin(),nums.end());
        for(int i=0; i<n; i++){
            if(i>0&&nums[i]==nums[i-1])continue;
            int j=i+1;
            int k=n-1;
            while(j<k){
                long long sum= nums[i];
                sum+=nums[j];
                sum+=nums[k];
                if(sum==0){
                    ans.push_back({nums[i], nums[j], nums[k]});
                    j++; k--;
                    while(j<k && nums[j]==nums[j-1]) j++;
                    while(j<k && nums[k]==nums[k+1]) k--;
                }
                else if(sum<0) j++;
                else k--;
            }
        }
        return ans;
    }
};
```

### ⏱ Time Complexity:
- **O(N²)** — outer loop + two pointers.

### 🧠 Space Complexity:
- **O(1)** (excluding result). No extra space like set used.

---

## ✅ Example:

Input:
```
nums = [-1, 0, 1, 2, -1, -4]
```

Output:
```
[[-1, -1, 2], [-1, 0, 1]]
```

---

## 📌 Summary Table:

| Approach      | Time Complexity | Space Complexity | Duplicates Handling |
|---------------|------------------|-------------------|----------------------|
| Brute Force   | O(N³)            | O(K)              | Set                 |
| Better (Hash) | O(N²)            | O(N + K)          | Set + Sorting       |
| Optimal       | O(N²)            | O(1)              | Sorting + Skipping  |

---
