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

/*:
 ![alternate text ](problem_invert_binary_tree.jpg)
 */
class Solution_Problem226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let left = invertTree(root?.right)
        let right = invertTree(root?.left)
        root?.left = left
        root?.right = right
        return root
    }
}


/*:
 ![alternate text ](problem_univalued_binary_tree.jpg)
 */
class Solution_Problem965 {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        var nodes = [TreeNode]()
        var isUnival = true
        
        if let root = root {
            let rooVal = root.val
            nodes.append(root)
            while nodes.count > 0 {
                let parentNode = nodes.removeFirst()
                if let leftChild = parentNode.left {
                    if leftChild.val != rooVal {
                        isUnival = false
                        break
                    } else {
                        nodes.append(leftChild)
                    }
                }
                
                if let rightChild = parentNode.right {
                    if rightChild.val != rooVal {
                        isUnival = false
                        break
                    } else {
                        nodes.append(rightChild)
                    }
                }
            }
        } else {
            isUnival = false
        }
        
        return isUnival
    }
}


class Solution_Problem606 {
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        
        let rootValStr = "\(root.val)"
        let leftSubTreeStr = tree2str(root.left)
        let rightSubTreeStr = tree2str(root.right)
        
        if leftSubTreeStr.isEmpty && !rightSubTreeStr.isEmpty {
            return rootValStr + "()(\(rightSubTreeStr))"
        } else if !leftSubTreeStr.isEmpty && !rightSubTreeStr.isEmpty {
            return rootValStr + "(\(leftSubTreeStr))(\(rightSubTreeStr))"
        } else if !leftSubTreeStr.isEmpty && rightSubTreeStr.isEmpty {
            return rootValStr + "(\(leftSubTreeStr))"
        } else {
            return rootValStr
        }
    }
}


class Solution_Problem100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }
        
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}

/*:
 ![alternate text ](problem_sum_of_left_leaves.jpg)
 */
class Solution_Problem404 {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if let root = root, root.left == nil, root.right == nil {
            return 0
        }
        
        var result = 0
        if let left = root?.left {
            if left.left == nil && left.right == nil {
                result += left.val
            } else {
                result += sumOfLeftLeaves(root?.left)
            }
        }
        
        result += sumOfLeftLeaves(root?.right)
        
        return result
    }
}

class Solution_Problem257 {
    var result = [String]()
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        preorderTraversal(root: root, path: nil)
        return result
    }
    
    func preorderTraversal(root: TreeNode?, path: String?) {
        guard let root = root else { return }
        
        if root.left == nil, root.right == nil {
            if let path = path {
                result.append("\(path)->\(root.val)")
            } else {
                result.append("\(root.val)")
            }
        }
        
        var currentPath: String? = nil
        if let path = path {
            currentPath = "\(path)->\(root.val)"
        } else {
            currentPath = "\(root.val)"
        }
        
        preorderTraversal(root: root.left, path: currentPath)
        preorderTraversal(root: root.right, path: currentPath)
    }
}


class Solution_Problem101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return isSymmetric(root?.left, root?.right)
    }
    
    func isSymmetric(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        
        if root1?.val != root2?.val {
            return false
        }
        
        return isSymmetric(root1?.left, root2?.right) && isSymmetric(root1?.right, root2?.left)
    }
}


/*:
 ![alternate text ](problem_deepest_leaves_sum.jpg)
 */
class Solution_Problem1302 {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var levelAndNodes = [(level: Int, node: TreeNode)]()
        levelAndNodes.append((level: 1, node: root))
        var sum = 0;
        var currentLevel = 1;
        
        while !levelAndNodes.isEmpty {
            let levelAndNode = levelAndNodes.removeFirst()
            if levelAndNode.level == currentLevel {
                sum += levelAndNode.node.val
            } else if (levelAndNode.level > currentLevel) {
                sum = levelAndNode.node.val
                currentLevel = levelAndNode.level
            }
            
            if let left = levelAndNode.node.left {
                levelAndNodes.append((level: levelAndNode.level + 1, node: left))
            }
            
            if let right = levelAndNode.node.right {
                levelAndNodes.append((level: levelAndNode.level + 1, node: right))
            }
        }
        
        return sum
    }
}


/*:
 ![alternate text ](problem_minimum_absolute_difference_in_BST.jpg)
*/
class Solution_Problem530 {
    var preValue = -1000000
    var minDiff = Int.max
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inorderTraversav(root: root)
        return minDiff
    }
    
    func inorderTraversav(root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        inorderTraversav(root: root.left)
        
        let diffToPreValue = root.val - preValue
        if diffToPreValue < minDiff {
            minDiff = diffToPreValue
        }
        
        preValue = root.val
        
        inorderTraversav(root: root.right)
    }
}

/*:
 ![alternate text ](problem_lowest_common_ancestor_of_a_binary_search_tree.jpg)
*/
class Solution_Problem235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }
        var pNodePath = [TreeNode]()
        var qNodePath = [TreeNode]()
        
        var currentNode = root
        while currentNode != nil {
            if let tmpCurrentNode = currentNode {
                pNodePath.append(tmpCurrentNode)
                if tmpCurrentNode.val == p.val {
                    break
                } else if tmpCurrentNode.val > p.val {
                    currentNode = currentNode?.left
                } else {
                    currentNode = currentNode?.right
                }
            }
        }
        
        currentNode = root
        while currentNode != nil {
            if let tmpCurrentNode = currentNode {
                qNodePath.append(tmpCurrentNode)
                if tmpCurrentNode.val == q.val {
                    break
                } else if tmpCurrentNode.val > q.val {
                    currentNode = currentNode?.left
                } else {
                    currentNode = currentNode?.right
                }
            }
        }
        
        pNodePath = pNodePath.reversed()
        qNodePath = qNodePath.reversed()
        
        if pNodePath.count > qNodePath.count {
            let diff = pNodePath.count - qNodePath.count
            var index = 0
            while pNodePath[index + diff].val != qNodePath[index].val {
                index += 1
            }
            return qNodePath[index]
        } else if pNodePath.count < qNodePath.count {
            let diff = qNodePath.count - pNodePath.count
            var index = 0
            while qNodePath[index + diff].val != pNodePath[index].val {
                index += 1
            }
            return pNodePath[index]
        } else {
            var index = 0
            while qNodePath[index].val != pNodePath[index].val {
                index += 1
            }
            return pNodePath[index]
        }
    }
}
