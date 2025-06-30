# DSA-Notes

🧮 1) Count Digits in a Number
Example Input: 12343
Expected Output: 5 (since it has 5 digits)

✅ First Approach: Using a Loop
java
Copy
Edit
int c = 0;
while (x > 0) {
    x = x / 10;
    c++;
}
Explanation:

Divide the number by 10 repeatedly.

Each division removes one digit from the number.

Count how many times this happens until the number becomes 0.

✅ Second Approach: Using Logarithm
java
Copy
Edit
int c = (int)(Math.log10(input)) + 1;
Explanation:

log10(input) returns the power to which 10 must be raised to get the input.

For example, log10(12343) ≈ 4.09

Adding 1 gives us the number of digits.

We use (int) to type cast to integer because log10 returns a decimal.

⚠️ Note:
This approach does not work if the number is 0, since log10(0) is undefined.

Add a check:

java
Copy
Edit
if (input == 0) c = 1;
Let me know if you’d like to include time complexity or edge cases.
