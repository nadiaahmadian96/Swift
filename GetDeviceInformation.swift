import UIKit

func getDeviceInfo() -> String {
    let device = UIDevice.current
    return "Device: \(device.name), Model: \(device.model), OS: \(device.systemName) \(device.systemVersion)"
}

// Usage:
print(getDeviceInfo())
