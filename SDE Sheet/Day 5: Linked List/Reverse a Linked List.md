🌀 Reverse a Linked List
========================

✅ Problem Statement
-------------------

Given the head of a singly linked list, reverse the list and return the reversed list.

* * * * *

🧠 Logic & Explanation
----------------------

We iteratively reverse the links of the list:

-   Maintain a pointer `newHead` that always points to the new reversed list's head.

-   Traverse the original list:

    -   Save the `next` node.

    -   Change `head->next` to point to `newHead`.

    -   Move `newHead` to current `head`.

    -   Move `head` to `next`.

This process effectively reverses the links between the nodes.

* * * * *

📦 C++ Code
-----------

```cpp

class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* newHead = NULL;
        while (head != NULL) {
            ListNode* next = head->next; // store next node
            head->next = newHead;        // reverse current node's pointer
            newHead = head;              // move newHead forward
            head = next;                 // move head forward
        }
        return newHead;
    }
};
```

* * * * *

☕ Java Code
-----------

```java

class Solution {
    public ListNode reverseList(ListNode head) {
        ListNode newHead = null;
        while (head != null) {
            ListNode next = head.next;  // store next node
            head.next = newHead;        // reverse current node's pointer
            newHead = head;             // move newHead forward
            head = next;                // move head forward
        }
        return newHead;
    }
}
```

* * * * *

⏱ Time Complexity
-----------------

-   **O(N)** --- We visit each node exactly once.

📦 Space Complexity
-------------------

-   **O(1)** --- No extra space used, only pointers.

* * * * *

🧪 Example
----------

**Input:**

rust

CopyEdit

`1 -> 2 -> 3 -> 4 -> 5`

**Output:**

rust

CopyEdit

`5 -> 4 -> 3 -> 2 -> 1`
