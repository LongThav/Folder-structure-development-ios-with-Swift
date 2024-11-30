import SwiftUI

struct HomeView: View {
    @Binding var currentRoute: AppRoute
    @Binding var selectedPostId: Int?  // Binding to pass the selected post ID to AppRouter
    @StateObject private var viewModel = PostsViewModel()  // Create the ViewModel instance
    
    var body: some View {
        NavigationView {
            VStack {
                // Show loading spinner if the data is still being fetched
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                // Show error message if fetching posts fails
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                // Show list of posts if data is available
                if !viewModel.posts.isEmpty {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                        }
                        .padding()
                        .onTapGesture {
                            // Set the selectedPostId and navigate to detail view
                            selectedPostId = post.id
                            currentRoute = .detail
                        }
                    }
                } else {
                    Text("No posts available")
                        .padding()
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()  // Fetch posts when the view appears
            }
        }
    }
}
