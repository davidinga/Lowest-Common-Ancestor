final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}

func lca(root: BinaryTreeNode?, a: BinaryTreeNode?, b: BinaryTreeNode?) -> Int {
    var result = -1
    var done = false
    
    @discardableResult func findLCA(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root, let a = a, let b = b else { return false }

        if a === root || b === root {
          result = root.value
          return true
        }

        let left = findLCA(root.left)
        let right = findLCA(root.right)

        if left && right, !done {
          result = root.value
          done = true
        }

        return left || right
    }
    
    findLCA(root)
    
    return result
}

func lowestCommonAncestor(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let root = root, p !== root, q !== root else { return root }

    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    if left != nil, right != nil { return root }

    return left ?? right
}