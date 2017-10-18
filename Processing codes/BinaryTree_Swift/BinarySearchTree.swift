//
//  BinarySearchTree.swift
//
//
//  Created by Nidesh Chitrakar on 3/20/17.
//
//

import Foundation

class BinarySearchTree<T: Comparable>
{
    var value: T
    var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var rootNode: BinarySearchTree?
    
    var height : Int
    {
        if isLeaf
        {
            return 1
        }
        else
        {
            return 1 + max(left?.height ?? 0, right?.height ?? 0)
        }
    }
    
    var isLeaf : Bool
    {
        return left == nil && right == nil
    }
    
    init ( initialValue : T )
    {
        value = initialValue
    }
    
    convenience init? ( withSortedData : [T] )
    {
        if (withSortedData.count > 0)
        {
            self.init( initialValue: withSortedData.first!)
            for element in withSortedData.dropFirst()
            {
                insert(element: element)
            }
        }
        else
        {
            return nil
        }
    }
    
    func insert( element : T )
    {
        if ( element < value )
        {
            if let left = left
            {
                left.insert( element: element )
            }
            else
            {
                left = BinarySearchTree( initialValue: element )
                left?.parent = self
            }
        }
        else
        {
            if let right = right
            {
                right.insert( element: element )
            }
            else
            {
                right = BinarySearchTree( initialValue: element )
                right?.parent = self
            }
        }
    }
    
    func contains( element : T ) -> Bool
    {
        return search( element: element ) != nil
    }
    
    func search( element : T ) -> BinarySearchTree?
    {
        var node: BinarySearchTree? = self
        while case let n? = node
        {
            if element < n.value
            {
                node = n.left
            }
            else if element > n.value
            {
                node = n.right
            }
            else
            {
                return node
            }
        }
        return nil
    }
    
    func delete( element : T )
    {
        //var itemToDelete = search(element: element)
        
        /*guard let node = search(element: element) else
         {
            return
         }*/
        var node = search(element: element)
        
        if (node == nil)
        {
            return
        }
        else
        {
            //node has 2 children
            if ( node!.left != nil && node!.right != nil )
            {
                
            }
                //node has 1 child
            else if ( node!.left != nil || node!.right != nil )
            {
                guard let parentNode = node!.parent else
                {
                    if node!.right == nil
                    {
                        rootNode = node!.left
                    }
                    else
                    {
                        rootNode = node!.right
                    }
                    rootNode?.parent = nil
                    node = nil
                    return
                }
            }
                //node has no children
            else
            {
                guard let parentNode = node!.parent else
                {
                    rootNode = nil
                    return
                }
                
                if ( parentNode.left == node )
                {
                    parentNode.left = nil
                }
                else
                {
                    parentNode.right = nil
                }
            }
            
        }
        
    }
    
    func makeBreadthFirstArray() -> [T] //Top to bottom, left to right
    {
        var queue = [BinarySearchTree]()
        var sortedArray = [T]()
        
        queue.append(self)
        
        while (!queue.isEmpty)
        {
            let node = queue.removeFirst()
            
            if (node.left != nil)
            {
                queue.append((node.left)!)
            }
            if (node.right != nil)
            {
                queue.append((node.right)!)
            }
            sortedArray.append((node.value))
        }
        
        return sortedArray
    }
    
    func makePreorderArray() -> [T]
    {
        let node: BinarySearchTree? = self
        
        if node == nil
        {
            return []
        }
        else
        {
            var orderedArray: [T] = []
            
            orderedArray.append(node!.value)
            if node!.left != nil
            {
                orderedArray += node!.left!.makePreorderArray()
            }
            if node!.right != nil
            {
                orderedArray += node!.right!.makePreorderArray()
            }
            
            return orderedArray
        }
    }
    
    func makeInorderArray() -> [T]
    {
        let node: BinarySearchTree? = self
        
        if node == nil
        {
            return []
        }
        else
        {
            var orderedArray: [T] = []
            
            if node!.left != nil
            {
                orderedArray += node!.left!.makeInorderArray()
            }
            orderedArray.append(node!.value)
            if node!.right != nil
            {
                orderedArray += node!.right!.makeInorderArray()
            }
            
            return orderedArray
        }
    }
    
    func makePostorderArray() -> [T]
    {
        let node: BinarySearchTree? = self
        
        if node == nil
        {
            return []
        }
        else
        {
            var orderedArray: [T] = []
            
            if node!.left != nil
            {
                orderedArray += node!.left!.makePostorderArray()
            }
            if node!.right != nil
            {
                orderedArray += node!.right!.makePostorderArray()
            }
            orderedArray.append(node!.value)
            
            return orderedArray
        }
    }
    
    /*func createBalancedTree() -> BinarySearchTree
     {
        return nil
     }*/
}
