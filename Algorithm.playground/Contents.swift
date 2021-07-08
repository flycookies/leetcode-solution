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
