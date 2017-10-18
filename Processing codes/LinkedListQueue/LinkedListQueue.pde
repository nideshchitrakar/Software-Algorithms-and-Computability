/*
  LinkedList Queue: FIFO (first in first out)
  A generic queue implemented using a linked list
  It supports 3 main functions: enqueue, dequeue, isEmpty.
  Makes use of a helper class Node.
  
  Written by: Nidesh Chitrakar
*/

import java.util.*;

// testing suite
void setup() {
  Queue q = new Queue();  // instantiate an empty queue
  q.enqueue(1);           // add element '1' to it
  println(q);
  q.enqueue(3);           // add element '3' to it
  println(q);
  q.enqueue(5);           // add element '5' to it
  println(q);
  q.dequeue();            // remove the first element, that is, '1' from it
  println(q);
}

class Queue<Type> implements Iterable<Type> {
  private int n;              // number of items in queue
  private Node<Type> head;    // beginning of queue
  private Node<Type> tail;    // end of queue
  
  // initialize an empty queue
  public Queue() {
    head = null;
    tail = null;
    n = 0;
  }
  
  // return true if empty, false otherwise
  boolean isEmpty() {
    return head == null;
  }
  
  // add an item to the end of the queue
  void enqueue( Type value ) {
    Node<Type> prevTail = tail;
    tail = new Node(value);
    tail.next = null;
    if (isEmpty()) head = tail;
    else prevTail.next = tail;
    n++;
  }
  
  // removes and returns the first element in the queue
  Type dequeue() {
    if (isEmpty()) return null;
    Type item = head.value;
    head = head.next;
    n--;
    if (isEmpty()) tail = null;
    return item;
  }
  
  // returns an iterator that iterates over items in FIFO order
  public Iterator<Type> iterator() {
    return new ListIterator<Type>(head);
  }
  
  // an iterator
  private class ListIterator<Type> implements Iterator<Type> {
    private Node<Type> current;
    
    public ListIterator(Node<Type> head) {
      current = head;
    }
    
    public boolean hasNext() { return current != null; }
    public void remove() { throw new UnsupportedOperationException(); }
    public Type next() {
      if (!hasNext()) throw new NoSuchElementException();
      Type item = current.value;
      current = current.next;
      return item;
    }
  }
  
  // returns a string representing the queue
  public String toString() {
    StringBuilder s = new StringBuilder();
        for (Type value : this) {
            s.append(value);
            s.append(' ');
        }
        return s.toString();
  }
  
}