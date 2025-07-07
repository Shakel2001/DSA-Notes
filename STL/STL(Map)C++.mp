🔹 What is map?
A map is a container that stores elements in key-value pairs.
Each key is unique, and it automatically sorts the data in ascending order of keys (by default using operator<).
Underlying data structure: Red-Black Tree (Self-balancing BST).
---------------------------------------------------------------
🔹 Syntax

#include <map>
std::map<key_type, value_type> map_name;
---------------------------------------------------------------
Example:

#include <iostream>
#include <map>
using namespace std;

int main() {
    map<int, string> mp; // map of int key and string value
    return 0;
}
---------------------------------------------------------------
🔹 Basic Operations & Syntax with Time Complexities
Operation	Syntax	Description	Time Complexity
Insert	mp[key] = value;
or
mp.insert({key, value});	Inserts key-value pair (updates if key exists)	O(log n)
Access	mp[key]	Accesses value at key (inserts if not present with default value)	O(log n)
Size	mp.size()	Returns number of elements	O(1)
Erase	mp.erase(key);	Deletes element with given key	O(log n)
Find	mp.find(key);	Returns iterator to key if found else mp.end()	O(log n)
Count	mp.count(key);	Returns 1 if key exists, else 0	O(log n)
Clear	mp.clear();	Removes all elements	O(n)
Empty	mp.empty();	Returns true if map is empty	O(1)
Traversal	for (auto it : mp)	Iterates over map in ascending order of keys	O(n)
---------------------------------------------------------------
🔹 Example Program
#include <iostream>
#include <map>
using namespace std;

int main() {
    map<int, string> mp;

    // Inserting elements
    mp[1] = "Apple";
    mp[2] = "Banana";
    mp[5] = "Cherry";

    mp.insert({3, "Dates"});

    // Accessing elements
    cout << "Key 2: " << mp[2] << endl;

    // Traversing map
    for (auto it : mp) {
        cout << it.first << " -> " << it.second << endl;
    }

    // Checking presence
    if (mp.find(4) == mp.end()) {
        cout << "Key 4 not found." << endl;
    }

    // Erasing element
    mp.erase(2);

    cout << "After erasing key 2:" << endl;
    for (auto it : mp) {
        cout << it.first << " -> " << it.second << endl;
    }

    return 0;
}
---------------------------------------------------------------
🔹 Key Properties of map
Automatically sorted by key.
No duplicate keys.
Values can be duplicated.
Internally uses Red-Black Tree, so operations like insert/find/erase are logarithmic.
---------------------------------------------------------------
🔹 Some Important Points
Inserting using [] vs insert:
mp[5] = "Orange"; will create key 5 if it doesn't exist.
insert will not overwrite existing keys.
---------------------------------------------------------------
Using auto for iterators:

for (auto it = mp.begin(); it != mp.end(); ++it) {
    cout << it->first << " " << it->second << endl;
}
---------------------------------------------------------------
Custom Comparator (Descending Order):

map<int, string, greater<int>> mp;
---------------------------------------------------------------
🔹 Time Complexities Summary
Operation	Time Complexity
Insertion	O(log n)
Deletion	O(log n)
Access ([])	O(log n)
Search (find())	O(log n)
Size/Empty	O(1)
Traversal	O(n)
---------------------------------------------------------------
✅ When to Use map
You need to store (key, value) pairs with sorted keys.
You want fast lookup, insertion, deletion with keys.
No duplicate keys are allowed.
