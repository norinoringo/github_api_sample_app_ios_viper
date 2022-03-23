public struct GitHubUser: Decodable {
    public var login: String
    public var id: Int
    public var nodeId: String
    public var avatarUrl: String
    public var gravatarId: String
    public var url: String
    public var htmlUrl: String
    public var followersUrl: String
    public var followingUrl: String
    public var gistsUrl: String
    public var starredUrl: String
    public var subscriptionsUrl: String
    public var organizationsUrl: String
    public var reposUrl: String
    public var eventsUrl: String
    public var receivedEventsUrl: String
    public var type: String
    public var siteDomain: Bool

    public enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteDomain = "site_admin"
    }
}
