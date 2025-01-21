func mostFrequentElement<T: Hashable>(in array: [T]) -> T? {
    let frequency = array.reduce(into: [:]) { counts, element in
        counts[element, default: 0] += 1
    }
    return frequency.max(by: { $0.value < $1.value })?.key
}

// Usage:
let array = [1, 2, 2, 3, 3, 3, 4, 4]
print(mostFrequentElement(in: array)) // Output: 3
