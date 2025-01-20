import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Current Mode: \(colorScheme == .dark ? "Dark" : "Light")")
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .cornerRadius(10)
    }
}
