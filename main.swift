/*
For your reference:
final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}
*/

func lca(root: BinaryTreeNode?, a: BinaryTreeNode?, b: BinaryTreeNode?) -> Int {
    var result = -1
    var done = false
    
    @discardableResult func findLCA(_ root: BinaryTreeNode?) -> (Bool, Bool) {
        guard let root = root, let a = a, let b = b else { return (false, false) }
        
        var left = findLCA(root.left)
        var right = findLCA(root.right)
        
        let found = (root.value == a.value || left.0 || right.0, root.value == b.value || left.1 || right.1)
        
        if found == (true, true) && !done {
            result = root.value
            done = true
        }
        
        return found
    }
    
    findLCA(root)
    
    return result
}