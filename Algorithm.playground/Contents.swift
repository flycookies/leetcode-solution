/*:
 ![alternate text ](problem_two_sum.jpg)
*/

import Foundation

class Solution_Problem1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numberIndexDict = [Int: Int]()
        var result = [Int]()
        
        for (index, value) in nums.enumerated() {
            let diffValue = target - value
            if let diffValueIndex = numberIndexDict[diffValue], diffValueIndex != index {
                result = [diffValueIndex, index]
                break
            }
            numberIndexDict[value] = index
        }
        
        return result
    }
}



 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
}

/*:
 ![alternate text ](problem_range_sum_of_BST.jpg)
*/
class Solution_Problem938 {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var result = 0
        if let root = root {
            if root.val >= low && root.val <= high {
                result += root.val
            }
            result += rangeSumBST(root.left, low, high)
            result += rangeSumBST(root.right, low, high)
        }
        
        return result
    }
}


class Solution_Problem104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        var result = 0
        if let root = root {
            result += 1
            result += max(maxDepth(root.left), maxDepth(root.right))
        }
        return result
    }
}


class Solution_Problem110 {
    var result = true
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if !result {
            return result
        }
        
        if root == nil {
            return true
        }
        
        let diff = maxDepth(root?.left) - maxDepth(root?.right)
        let isBalance = isBalanced(root?.left) && isBalanced(root?.right) && abs(diff) <= 1
        result = isBalance
        return isBalance
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        var result = 0
        if let root = root {
            result += 1
            result += max(maxDepth(root.left), maxDepth(root.right))
        }
        return result
    }
}

/*:
 ![alternate text ](problem_spiral_matrix_II.jpg)
 */
class Solution_Problem59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var row = 0
        var col = 0
        var value = 1
        while value <= n * n {
            while col < n && result[row][col] == 0 {
                result[row][col] = value
                value += 1
                col += 1
            }

            col -= 1
            row += 1
            while row < n && result[row][col] == 0 {
                result[row][col] = value
                value += 1
                row += 1
            }

            row -= 1
            col -= 1
            while col >= 0 && result[row][col] == 0 {
                result[row][col] = value
                value += 1
                col -= 1
            }

            col += 1
            row -= 1
            while row >= 0 && result[row][col] == 0 {
                result[row][col] = value
                value += 1
                row -= 1
            }

            row += 1
            col += 1
        }
        
        return result
    }
}


/*:
 ![alternate text ](problem_spiral_matrix.jpg)
*/
class Solution_Problem54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var tmpMartrix = matrix
        let clearFlag = 1000
        var result = [Int]()
        
        let rowCount = matrix.count
        let colCount = matrix[0].count
        
        var row = 0
        var col = 0
        var value = 1
        
        while value <= rowCount * colCount {
            while col < colCount && tmpMartrix[row][col] != clearFlag {
                result.append(tmpMartrix[row][col])
                tmpMartrix[row][col] = clearFlag
                value += 1
                col += 1
            }

            col -= 1
            row += 1
            while row < rowCount && tmpMartrix[row][col] != clearFlag {
                result.append(tmpMartrix[row][col])
                tmpMartrix[row][col] = clearFlag
                value += 1
                row += 1
            }

            row -= 1
            col -= 1
            while col >= 0 && tmpMartrix[row][col] != clearFlag {
                result.append(tmpMartrix[row][col])
                tmpMartrix[row][col] = clearFlag
                value += 1
                col -= 1
            }

            col += 1
            row -= 1
            while row >= 0 && tmpMartrix[row][col] != clearFlag {
                result.append(tmpMartrix[row][col])
                tmpMartrix[row][col] = clearFlag
                value += 1
                row -= 1
            }

            row += 1
            col += 1
        }
        
        return result
    }
}

/*:
 ![alternate text ](problem_merge_two_binary_trees.jpg)
*/
class Solution_Problem617 {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        let newRoot = TreeNode(root1.val + root2.val)
        newRoot.left = mergeTrees(root1.left, root2.left)
        newRoot.right = mergeTrees(root1.right, root2.right)
        
        return newRoot
    }
}

/*:
 ![alternate text ](problem_search_in_a_binary_search_tree.jpg)
 */
class Solution_Problem700 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var tmpRoot = root
        
        while tmpRoot != nil {
            if let currentRoot = tmpRoot {
                if currentRoot.val == val {
                    return tmpRoot
                }
                
                if currentRoot.val < val {
                    tmpRoot = currentRoot.right
                } else {
                    tmpRoot = currentRoot.left
                }
            }
        }
        
        return tmpRoot
    }
}


/*:
 ![alternate text ](problem_increasing_order_search_tree.jpg)
 */
class Solution_Problem897 {
    var nodes = [TreeNode]()
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        inorderTraverse(root)
        
        for i in 0..<nodes.count {
            nodes[i].left = nil;
            nodes[i].right = nil
            if i > 0 {
                nodes[i - 1].right = nodes[i]
            }
        }
        
        return nodes[0]
    }
    
    func inorderTraverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        inorderTraverse(root?.left)
        nodes.append(root!)
        inorderTraverse(root?.right)
    }
}



// Definition for a Node.
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

/*:
 ![alternate text ](problem_N_ary_tree_preorder_traversal.jpg)
 */
class Solution_Problem589 {
    func preorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        if let root = root {
            result.append(root.val)
            for node in root.children {
                result.append(contentsOf: preorder(node))
            }
        }
        
        return result
    }
}


/*:
 ![alternate text ](problem_N_ary_tree_postorder_traversal.jpg)
 */
class Solution_Problem590 {
    func postorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        if let root = root {
            for node in root.children {
                result.append(contentsOf: postorder(node))
            }
            result.append(root.val)
        }
        
        return result
    }
}

/*:
 ![alternate text ](problem_sum_of_root_to_leaf_binary_numbers.jpg)
 */
class Solution_Problem1022 {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var result = 0
        var nodes = [TreeNode]()
        if let root = root {
            nodes.append(root)
            
            while nodes.count != 0 {
                let firstNode = nodes.removeFirst()
                if firstNode.left == nil && firstNode.right == nil {
                    result += firstNode.val
                }
                
                if let leftNode = firstNode.left {
                    leftNode.val += firstNode.val * 2
                    nodes.append(leftNode)
                }
                
                if let rightNode = firstNode.right {
                    rightNode.val += firstNode.val * 2
                    nodes.append(rightNode)
                }
            }
        }
        
        return result
    }
}
