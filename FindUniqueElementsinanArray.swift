func findUniqueElements<T: Hashable>(in array: [T]) -> [T] {
    var seen = Set<T>()
    return array.filter { seen.insert($0).inserted }
}

// Usage:
let array = [1, 2, 2, 3, 4, 4, 5]
print(findUniqueElements(in: array)) // Output: [1, 2, 3, 4, 5]
