public struct GitHubUserDetail: Decodable {
    public var login: String
    public var avatarUrl: String
    public var userFullName: String
    public var followers: Int
    public var following: Int

    public enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case userFullName = "name"
        case followers
        case following
    }
}
