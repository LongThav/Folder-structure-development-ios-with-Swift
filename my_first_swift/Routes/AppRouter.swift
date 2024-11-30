import SwiftUI

enum AppRoute {
    case home
    case detail
}

struct AppRouter: View {
    @State private var currentRoute: AppRoute = .home  // Default route when the app launches
    @State private var selectedPostId: Int? = nil      // To hold the selected post ID
    
    var body: some View {
        VStack {
            // Check the current route and show the appropriate view
            if currentRoute == .home {
                // Pass the selectedPostId binding to HomeView
                HomeView(currentRoute: $currentRoute, selectedPostId: $selectedPostId)
            } else if currentRoute == .detail, let postId = selectedPostId {
                // Pass the selected postId to DetailView
                DetailView(currentRoute: $currentRoute, postId: postId)
            }
        }
    }
}

struct AppRouter_Previews: PreviewProvider {
    static var previews: some View {
        AppRouter()
    }
}
