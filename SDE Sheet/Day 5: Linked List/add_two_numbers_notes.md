# Add Two Numbers (Linked List)

## Problem Statement
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

---

## Logic Explanation

1. Initialize a dummy node to simplify the result list construction.
2. Use a pointer `temp` to track the end of the result list and a variable `carry` to handle digit overflow.
3. Traverse both `l1` and `l2` until all digits and carry are processed.
4. At each step:
   - Add values from `l1` and `l2` if they are not `NULL`.
   - Add the carry from the previous operation.
   - Compute the new carry (`sum / 10`) and the digit to store in the new node (`sum % 10`).
5. Append the new node to the result list.
6. Return the list starting from `dummy->next`.

---

## C++ Code
```cpp
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* dummy = new ListNode();
        ListNode* temp = dummy;
        int carry = 0;

        while (l1 != NULL || l2 != NULL || carry) {
            int sum = 0;

            if (l1 != NULL) {
                sum += l1->val;
                l1 = l1->next;
            }

            if (l2 != NULL) {
                sum += l2->val;
                l2 = l2->next;
            }

            sum += carry;
            carry = sum / 10;

            ListNode* node = new ListNode(sum % 10);
            temp->next = node;
            temp = temp->next;
        }

        return dummy->next;
    }
};
```

---

## Java Code
```java
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode temp = dummy;
        int carry = 0;

        while (l1 != null || l2 != null || carry != 0) {
            int sum = 0;

            if (l1 != null) {
                sum += l1.val;
                l1 = l1.next;
            }

            if (l2 != null) {
                sum += l2.val;
                l2 = l2.next;
            }

            sum += carry;
            carry = sum / 10;

            temp.next = new ListNode(sum % 10);
            temp = temp.next;
        }

        return dummy.next;
    }
}
```
