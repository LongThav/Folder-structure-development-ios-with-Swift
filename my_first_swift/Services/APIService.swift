import Foundation
import Combine

class APIService {
    static let shared = APIService() // Singleton
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // Extract the data
            .decode(type: [Post].self, decoder: JSONDecoder()) // Decode the data into an array of Post objects
            .eraseToAnyPublisher() // Return a publisher
    }
    
    // Fetch a single post by ID
    func fetchPostById(id: Int) -> AnyPublisher<PostDetailModel, Error> {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }
        
        print("Fetching post from URL: \(url.absoluteString)")
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { data, _ in
                    // Print the raw response data for debugging
//                    print(String(data: data, encoding: .utf8) ?? "Unable to print data")
                    return data
                }
                .decode(type: PostDetailModel.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }}
