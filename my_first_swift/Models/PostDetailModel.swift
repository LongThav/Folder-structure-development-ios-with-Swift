import Foundation

struct PostDetailModel: Identifiable, Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
