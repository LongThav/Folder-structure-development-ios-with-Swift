import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            AppRouter()  // Use AppRouter for central route management
        }
    }
}
