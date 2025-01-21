import LocalAuthentication
import SwiftUI

class BiometricAuthenticator: ObservableObject {
    @Published var isAuthenticated = false
    @Published var authError: String? = nil

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access requires authentication") { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    } else {
                        self.authError = error?.localizedDescription
                    }
                }
            }
        } else {
            authError = "Biometric authentication is not available."
        }
    }
}

// Usage in a View:
struct BiometricView: View {
    @StateObject private var authenticator = BiometricAuthenticator()

    var body: some View {
        VStack {
            if authenticator.isAuthenticated {
                Text("Welcome!")
            } else {
                Button("Authenticate") {
                    authenticator.authenticate()
                }
                if let error = authenticator.authError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
    }
}
