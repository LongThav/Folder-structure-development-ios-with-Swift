import Foundation
import Network

class NetworkUtils {
    
    static let shared = NetworkUtils()
    
    // Check if the device is connected to the internet
    func isConnectedToNetwork() -> Bool {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitorQueue")
        var isConnected = false
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            } else {
                isConnected = false
            }
        }
        
        monitor.start(queue: queue)
        
        // Return the connectivity status
        return isConnected
    }
    
    // Handle Network errors gracefully
    func handleNetworkError(_ error: Error) -> String {
        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                return "No internet connection."
            case .timedOut:
                return "Request timed out."
            default:
                return "An unknown network error occurred."
            }
        }
        return "An error occurred: \(error.localizedDescription)"
    }
}
