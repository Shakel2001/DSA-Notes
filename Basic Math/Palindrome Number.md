✅ Code
cpp
Copy
Edit
class Solution {
public:
    bool isPalindrome(int x) {
        int temp = x;
        long long rev = 0;
        while (x > 0) {
            int ld = x % 10;       // Get last digit
            x /= 10;               // Remove last digit
            rev = (rev * 10) + ld; // Build reversed number
        }
        return (temp == rev) ? true : false;
    }
};
✅ Explanation
temp stores the original number.

rev is used to reverse the number.

In the loop:

% 10 gets the last digit.

/= 10 removes the last digit.

rev = rev * 10 + ld adds the digit to the reversed number.

After the loop, we compare the original number (temp) with the reversed number (rev).

If they are equal, the number is a palindrome.

🧮 Example
Input: 121 → Reverse: 121 → Output: true

Input: 123 → Reverse: 321 → Output: false

✅ One-Liner Return
cpp
Copy
Edit
return (temp == rev) ? true : false;
Or even shorter:

cpp
Copy
Edit
return temp == rev;
⚠️ Edge Case
The function does not handle negative numbers, because a negative number can't be a palindrome (e.g., -121 ≠ 121-).

To fix that, add a check at the beginning:

cpp
Copy
Edit
if (x < 0) return false;
