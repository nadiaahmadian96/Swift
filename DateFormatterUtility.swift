import Foundation

struct DateHelper {
    static func formattedDate(from date: Date, format: String = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

// Usage:
let currentDate = Date()
let formattedDate = DateHelper.formattedDate(from: currentDate)
print(formattedDate)
