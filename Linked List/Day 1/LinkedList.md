# 📘 Linked List Basics in C++

**YouTube Reference:** [Apna College Linked List Tutorial](https://youtu.be/Nq7ok-OyEpg?feature=shared)

---

## 📌 Topics Covered

1. Node structure
2. Convert array to Linked List
3. Print Linked List
4. Length of Linked List
5. Search a value in Linked List

---

## ✅ 1. Node Structure

```cpp
class Node {
public:
    int data;
    Node* next;

    Node(int data1, Node* next1) {
        data = data1;
        next = next1;
    }

    Node(int data1) {
        data = data1;
        next = nullptr;
    }
};
```

### 📌 Explanation:
- Each **Node** contains:
  - An `int data` to store value
  - A `Node* next` to point to the next node
- Constructor 1: Allows manual next pointer assignment
- Constructor 2: Just sets data and assigns `nullptr` to `next`

### 🔍 Visual:
```
   +------+------+
   | Data | Next |
   +------+------+
```

---

## ✅ 2. Convert Array to Linked List

```cpp
Node* converArrToLL(vector<int> &arr) {
    Node* head = new Node(arr[0]);
    Node* mover = head;
    for(int i = 1; i < arr.size(); i++) {
        Node* temp = new Node(arr[i]);
        mover->next = temp;
        mover = temp;
    }
    return head;
}
```

### 📌 Explanation:
- Takes a vector and creates a linked list
- `head` → stores the first element
- `mover` → tracks the last node while building

### 🔍 Visual:
For array `[1, 2, 3, 4]`
```
head → [1 | o] → [2 | o] → [3 | o] → [4 | nullptr]
```

---

## ✅ 3. Print Linked List

```cpp
void printLL(Node* head) {
    Node* temp = head;
    while(temp != nullptr) {
        cout << temp->data << " ";
        temp = temp->next;
    }
}
```

### 📌 Explanation:
- Starts from `head`
- Prints `data` while moving through the list

### 🔍 Example Output:
```
1 2 3 4
```

---

## ✅ 4. Length of Linked List

```cpp
void lengthOfLL(Node* head) {
    Node* temp = head;
    int cnt = 0;
    while(temp != nullptr) {
        temp = temp->next;
        cnt++;
    }
    cout << "\n" << cnt;
}
```

### 📌 Explanation:
- Iterates through each node, counting until it reaches `nullptr`

---

## ✅ 5. Check if a Value Exists in LL

```cpp
int checkValinLL(Node* head, int val) {
    Node* temp = head;
    while(temp != nullptr) {
        if(temp->data == val) {
            return 1;
        }
        temp = temp->next;
    }
    return 0;
}
```

### 📌 Explanation:
- Returns `1` if value found, otherwise `0`

### 🔍 Example:
```cpp
checkValinLL(head, 3) → 1
checkValinLL(head, 22) → 0
```

---

## 🔚 Main Function

```cpp
int main() {
    vector<int> arr = {1, 2, 3, 4};
    Node* head = converArrToLL(arr);
    cout << head->data << endl;  // Prints 1
    printLL(head);               // Prints full LL
    lengthOfLL(head);           // Prints length
    cout << "\n" << checkValinLL(head, 22); // Checks value
}
```

---

## 📝 Summary

| Function         | Purpose                          |
|------------------|----------------------------------|
| `converArrToLL`  | Converts array to linked list    |
| `printLL`        | Displays all elements            |
| `lengthOfLL`     | Counts number of nodes           |
| `checkValinLL`   | Checks if a value exists in LL   |

---

## 📎 YouTube Link

🔗 [Watch Tutorial on YouTube](https://youtu.be/Nq7ok-OyEpg?feature=shared)
