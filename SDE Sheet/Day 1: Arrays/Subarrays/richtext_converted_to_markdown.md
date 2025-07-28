🧠 Maximum Subarray Sum (Kadane's Algorithm)
--------------------------------------------

### 🔍 Problem Statement

Given an array of integers, find the **contiguous subarray (containing at least one number)** which has the largest sum and return its sum.

### 🚀 Approaches

#### 1️⃣ Brute Force (O(n³))

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   cppCopyEdit#include  using namespace std;  int main(){      int arr[8]={-2,-3,4,-1,-2,1,5,-3};      int maxS=INT_MIN;      for(int i=0; i<8; i++){          for(int j=i; j<8; j++){              int sum=0;              for(int k=i; k<=j; k++){                  sum = sum + arr[k];              }              maxS = max(sum, maxS);          }      }      cout << maxS;  }   `

✅ **Logic**:

*   Generate all possible subarrays using 3 nested loops.
    
*   Calculate the sum of each subarray.
    
*   Keep track of the maximum sum seen so far.
    

❌ **Time Complexity**: O(n³)❌ **Space Complexity**: O(1)

#### 2️⃣ Better Approach (O(n²))

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   cppCopyEdit#include  using namespace std;  int main(){      int arr[8]={-2,-3,4,-1,-2,1,5,-3};      int maxS=INT_MIN;      for(int i=0; i<8; i++){          int sum=0;          for(int j=i; j<8; j++){              sum = sum + arr[j];              maxS = max(sum, maxS);          }      }      cout << maxS;  }   `

✅ **Logic**:

*   Avoid recalculating sums by maintaining a running sum inside the second loop.
    

⏱️ **Time Complexity**: O(n²)🧠 **Space Complexity**: O(1)

#### 3️⃣ Optimal Solution — Kadane’s Algorithm (O(n))

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   cppCopyEditclass Solution {  public:      int maxSubArray(vector& nums) {          int maxS = INT_MIN;          int sum = 0;          for(int i = 0; i < nums.size(); i++){              sum += nums[i];              maxS = max(maxS, sum);              if(sum < 0){                  sum = 0;              }          }          return maxS;      }  };   `

✅ **Logic**:

*   Iterate over the array once.
    
*   Keep adding current element to the sum.
    
*   If the sum becomes negative, reset it to 0.
    
*   Track the max sum encountered.
    

⚡ **Time Complexity**: O(n)🧠 **Space Complexity**: O(1)

### 🔎 Example:

**Input:** \[-2, -3, 4, -1, -2, 1, 5, -3\]**Output:** 7**Explanation:** Maximum subarray is \[4, -1, -2, 1, 5\]

### ✅ Summary

ApproachTime ComplexitySpace ComplexityEfficiencyBrute ForceO(n³)O(1)❌BetterO(n²)O(1)⚠️Kadane's AlgoO(n)O(1)✅

🧑‍💻 **Pro Tip:** This is one of the most asked interview questions. Always try to implement the optimal (Kadane’s) approach first if constraints allow.