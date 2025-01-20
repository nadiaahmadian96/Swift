import Network

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    @Published var isConnected: Bool = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}

// Usage:
struct ContentView: View {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        Text(networkMonitor.isConnected ? "Connected" : "No Internet")
            .padding()
            .background(networkMonitor.isConnected ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
