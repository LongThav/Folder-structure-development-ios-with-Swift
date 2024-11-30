import SwiftUI

struct DetailView: View {
    @Binding var currentRoute: AppRoute  // Binding to update the route
    let postId: Int  // The ID of the post you want to display
    @StateObject private var viewModel = PostsViewModel()  // ViewModel to fetch post data
    
    var body: some View {
        VStack {
            // Add a "Back to Home" button
            Button(action: {
                // Action to go back to the home view
                currentRoute = .home  // This will trigger the navigation back to HomeView
            }) {
                Text("Back to Home")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Show post details if available
            if let post = viewModel.selectedPost {
                Text(post.title)
                    .font(.largeTitle)
                    .padding()
                
                Text(post.body)
                    .padding()
            } else if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text("Post not found")
                    .padding()
            }
        }
        .onAppear {
            // Fetch the post when the view appears
            viewModel.fetchPostById(id: postId)
        }
        .navigationBarTitle("Post Details", displayMode: .inline) // Title for the navigation bar
        .navigationBarBackButtonHidden(true) // Hide the default back button if using custom back button
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview the DetailView with a post ID of 1
        DetailView(currentRoute: .constant(.detail), postId: 1)
    }
}
