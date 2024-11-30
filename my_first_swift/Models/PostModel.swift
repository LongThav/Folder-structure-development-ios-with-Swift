import Foundation

struct Post: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String

    // id will be used as the unique identifier for each item
    // Since 'id' is already part of the model, we don't need any additional work
}
