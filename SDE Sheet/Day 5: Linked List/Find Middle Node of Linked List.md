📍 Find Middle Node of Linked List
==================================

✅ Problem Statement
-------------------

Given the head of a singly linked list, return the **middle node**.\
If there are two middle nodes, return:

-   **Second middle node** (standard)

-   **First middle node** (variant --- if explicitly asked)

* * * * *

🔍 Approaches
-------------

### 💥 Brute Force --- Two Pass

1.  First, count the total number of nodes (`tN`).

2.  Then move to the `tN / 2`-th node and return it.

#### ✅ C++ Code:

```cpp

class Solution {
public:
    ListNode* middleNode(ListNode* head) {
        int tN = 0;
        ListNode* curr = head;
        while (curr != NULL) {
            tN++;
            curr = curr->next;
        }

        int mid = tN / 2;
        curr = head;
        while (mid > 0) {
            curr = curr->next;
            mid--;
        }
        return curr;
    }
};
```

#### ⏱ Time Complexity: `O(N)`

#### 🧠 Space Complexity: `O(1)`

* * * * *

### ⚡ Optimal --- Fast and Slow Pointer (Tortoise-Hare)

-   Move `slow` one step at a time.

-   Move `fast` two steps at a time.

-   When `fast` reaches the end, `slow` will be at the middle.

#### ✅ C++ Code:

```cpp

class Solution {
public:
    ListNode* middleNode(ListNode* head) {
        ListNode* slow = head;
        ListNode* fast = head;
        while (fast != NULL && fast->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
        }
        return slow;
    }
};
```

#### 🧠 Returns: Second middle (for even-length)

* * * * *

### 🧩 Variant: Return First Middle Node (Even-Length)

-   Stop earlier by checking `fast->next != NULL && fast->next->next != NULL`.

#### ✅ C++ Code:

```cpp

class Solution {
public:
    ListNode* middleNode(ListNode* head) {
        ListNode* slow = head;
        ListNode* fast = head;
        while (fast->next != NULL && fast->next->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
        }
        return slow;
    }
};
```

#### 🧠 Returns: First middle (for even-length)

* * * * *

🧪 Example
----------

### Input:

rust


`1 -> 2 -> 3 -> 4 -> 5`

### Output:



`3`

### Input:

rust


`1 -> 2 -> 3 -> 4 -> 5 -> 6`

-   **Second Middle:** `4`

-   **First Middle (variant):** `3`

* * * * *

🧠 Summary Table
----------------

| Approach | Time | Space | Returns |
| --- | --- | --- | --- |
| Brute Force | O(N) | O(1) | Second Middle |
| Optimal (2ptr) | O(N) | O(1) | Second Middle |
| Even First | O(N) | O(1) | First Middle (even) |
