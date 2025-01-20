import Foundation

class Debouncer {
    private let delay: TimeInterval
    private var timer: Timer?
    
    init(delay: TimeInterval) {
        self.delay = delay
    }
    
    func run(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            action()
        }
    }
}

// Usage:
let debouncer = Debouncer(delay: 0.5)
debouncer.run {
    print("Action executed!")
}
