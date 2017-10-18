/*
  Node class to represent nodes in a linked list
*/

class Node<Type> {
  public Type value;
  Node<Type> next;
  Node<Type> prev;
  
  Node(Type initialValue) {
    this.value = initialValue;
  }
  
  public String toString() {
    return value.toString();
  }
}