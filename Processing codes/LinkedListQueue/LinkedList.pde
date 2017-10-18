/*
  Linked List implementation in Java. Currently experiencing issues with pointers
  so I chose another way to implement it without having to use this class.
*/

class LinkedList<Type> {
  
  Node<Type> head;
  Node<Type> tail;
  
  LinkedList() {
    head = null;
    tail = null;
  }
  
  void insertAtHead( Node<Type> newNode ) {
    if (head == null) tail = newNode;
    
    newNode.next = head;
    head.prev = newNode;
    head = newNode;
  }
  
  void insertAtTail( Node<Type> newNode ) {
    if (tail == null) {
      if (head == null) {
        head = newNode;
      }
      else {
        tail = newNode;
        head.next = tail;
        tail.prev = head;
      }
    }
    if (head == null) {
      insertAtHead(newNode);
    }
    else {
      newNode.prev = tail;
      tail.next = newNode;
      tail = newNode;
    }
  }
  
  boolean isEmpty() {
    if ((head == null) && (tail == null)) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void insertAfter( Node<Type> node, Node<Type> newNode ) {
    Node<Type> nextNode = node.next;
    
    if (node.next == null) insertAtTail(newNode);
    else {
      newNode.next = nextNode;
      newNode.prev = node;
      nextNode.prev = newNode;
      node.next = newNode;
    }
  }
  
  void removeHead() {
    head = head.next;
    head.prev = null;
  }

  void removeTail() {
    tail = tail.prev;
    tail.next = null;
  }
  
  void remove( Node<Type> node ) {
    Node<Type> nextNode = node.next;
    Node<Type> prevNode = node.prev;
    
    if (node == head && node == tail) {
      head = null;
      tail = null;
    }
    else if (node == head) removeHead();
    else if (node == tail) removeTail();
    else {
      prevNode.next = nextNode;
      nextNode.prev = prevNode;
    }
  }
  
  Node<Type> at( int index ) {
    if (index >= 0) {
      Node<Type> node = head;
      int i = index;
      
      while (node != null) {
        if (i == 0) return node;
        i -= 1;
        node = node.next;
      }
    }
    return null;
  }
  
  int length() {
    if (head == null) return 0;
    else {
      Node<Type> currentNode = head;
      int i = 1;
      
      while (currentNode.next != null) {
        currentNode = currentNode.next;
        i += 1;
      }
      return i;
    }
  }
  
  void removeAt( int index ) {
    Node<Type> nodeToRemove = at(index);
    Node<Type> nextNode = nodeToRemove.next;
    Node<Type> prevNode = nodeToRemove.prev;
    
    prevNode.next = nextNode;
    nextNode.prev = prevNode;
  }
  
  void append( LinkedList list ) {
    tail.next = list.head;
    list.head.prev = tail;
    tail = list.tail;
  }
  
  Node<Type> findFirst(Type keyToFind) {
    Node<Type> currentNode = head;
    
    while ((currentNode.value != keyToFind) && (currentNode.next != null)) {
      currentNode = currentNode.next;
    }
    
    return currentNode;
  }

}