public struct GitHubUserRepositry: Codable {
    public var repositoryName: String
    public var description: String?
    public var language: String?
    public var stargazersCount: Int
    public var url: String
    public var fork: Bool

    enum CodingKeys: String, CodingKey {
        case repositoryName = "name"
        case description
        case language
        case stargazersCount = "stargazers_count"
        case url = "html_url"
        case fork
    }
}
