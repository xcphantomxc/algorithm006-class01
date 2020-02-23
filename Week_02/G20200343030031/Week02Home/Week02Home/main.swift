//
//  main.swift
//  Week02Home
//
//  Created by 薛忱 on 2020/2/23.
//  Copyright © 2020 薛忱. All rights reserved.
//

import Foundation

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

// 49. 字母异位词分组
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var resultArray: Array<Array<String>> = []
    var dic: [[String] : [String]] = [:]

    for subString in strs {
        var charArray = subString.map{String($0)}
        charArray = charArray.sorted(by: { (aStr, bStr) -> Bool in
            return aStr < bStr
        })
        print(charArray)

        guard (dic[charArray] != nil) else {
            dic[charArray] = [subString]
            continue
        }

        dic[charArray]?.append(subString)
    }

    for value in dic.values {
        resultArray.append(value)
    }
    return resultArray
}

//144. 二叉树的前序遍历

var resultArray: [Int] = []
func preorderTraversal(_ root: TreeNode?) -> [Int] {

    startConvenient(root: root)
    return resultArray
}

func startConvenient(root: TreeNode?) {

    if root != nil {
        resultArray.append(root?.val ?? -1)
        startConvenient(root: root?.left)
        startConvenient(root: root?.right)
    }

}

//105. 从前序与中序遍历序列构造二叉树
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    if preorder.count == 0 && inorder.count == 0 {
        return nil
    } else {
        let treeNode = TreeNode.init(preorder[0])

        let rootIndex = inorder.firstIndex(of: preorder[0])
        
        // 左子树
        var leftTreeP = Array(preorder.prefix(rootIndex! + 1))
        leftTreeP.remove(at: 0)
        let leftTreeI = Array(inorder.prefix(rootIndex!))
        treeNode.left = buildTree(leftTreeP, leftTreeI)
        
        // 右子树
        let rightTreeP = Array(preorder.suffix(inorder.count - (rootIndex! + 1)))
        let rightTreeI = Array(inorder.suffix(inorder.count - (rootIndex! + 1)))
        treeNode.right = buildTree(rightTreeP, rightTreeI)
        
        return treeNode
    }
    
    
}


