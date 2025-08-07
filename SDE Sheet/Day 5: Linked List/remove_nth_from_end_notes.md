# Remove N-th Node From End of List

## Problem Statement
Given a linked list, remove the n-th node from the end of the list and return its head.

---

## Brute Force Approach

### Logic Explanation:
1. Traverse the entire linked list to find its length.
2. If the node to be removed is the head (i.e., `n == length`), delete the head.
3. Otherwise, traverse again to the node just before the one to be removed.
4. Change the `next` pointer to skip the node to be deleted and free the memory.

### C++ Code:
```cpp
class Solution {
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode* temp = head;
        long length = 0;
        while (temp != NULL) {
            length++;
            temp = temp->next;
        }

        if (n == length) {
            ListNode* newHead = head->next;
            delete head;
            return newHead;
        }

        temp = head;
        for (int i = 1; i < length - n; i++) {
            temp = temp->next;
        }

        ListNode* nodeToDelete = temp->next;
        temp->next = temp->next->next;
        delete nodeToDelete;

        return head;
    }
};
```

### Java Code:
```java
class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode temp = head;
        int length = 0;

        while (temp != null) {
            length++;
            temp = temp.next;
        }

        if (n == length) {
            return head.next;
        }

        temp = head;
        for (int i = 1; i < length - n; i++) {
            temp = temp.next;
        }

        temp.next = temp.next.next;

        return head;
    }
}
```

---

## Optimal Approach (Two Pointer Technique)

### Logic Explanation:
1. Create a dummy node that points to the head of the list.
2. Initialize two pointers (`fast` and `slow`) at the dummy node.
3. Move the `fast` pointer `n` steps ahead.
4. Then move both pointers together until `fast` reaches the end.
5. Now `slow` is just before the node to be removed.
6. Adjust the `next` pointer to skip the target node.

### C++ Code:
```cpp
class Solution {
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode* start = new ListNode();
        start->next = head;
        ListNode* fast = start;
        ListNode* slow = start;

        for (int i = 1; i <= n; i++) {
            fast = fast->next;
        }

        while (fast->next != NULL) {
            fast = fast->next;
            slow = slow->next;
        }

        slow->next = slow->next->next;

        return start->next;
    }
};
```

### Java Code:
```java
class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode start = new ListNode(0);
        start.next = head;
        ListNode fast = start;
        ListNode slow = start;

        for (int i = 1; i <= n; i++) {
            fast = fast.next;
        }

        while (fast.next != null) {
            fast = fast.next;
            slow = slow.next;
        }

        slow.next = slow.next.next;

        return start.next;
    }
}
```
