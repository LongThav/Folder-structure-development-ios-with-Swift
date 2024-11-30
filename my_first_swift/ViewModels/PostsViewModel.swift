import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var selectedPost: PostDetailModel? = nil
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        
        // Simulating a network request that fetches posts
        APIService.shared.fetchPosts()
            // Ensure updates happen on the main thread
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
            }, receiveValue: { posts in
                // Model updates will now happen on the main thread
                self.posts = posts
            })
            .store(in: &cancellables)
    }
    
    func fetchPostById(id: Int) {
            isLoading = true
            errorMessage = nil
            
            APIService.shared.fetchPostById(id: id)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    self.isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = "Error: \(error.localizedDescription)"
                    }
                }, receiveValue: { post in
                    self.selectedPost = post
                })
                .store(in: &cancellables)
        }
}
