public struct GitHubRepositry: Codable {
    public var items: [GitHubUserRepositry]

    enum CodingKeys: String, CodingKey {
        case items
    }
}
