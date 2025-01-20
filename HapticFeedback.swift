import UIKit

struct HapticFeedback {
    static func generateFeedback(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}

// Usage:
// Call this function wherever you need haptic feedback
HapticFeedback.generateFeedback(for: .success)
