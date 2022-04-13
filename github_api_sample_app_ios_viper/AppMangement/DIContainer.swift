import Foundation

class DIContainer {
    private static var fetchGitHubAPIClientRepositoryCreater: (() -> FetchGitHubAPIClientRepository)!
}

extension DIContainer {
    enum `Type` {
        case real
        case inMemory
    }

    static func setup(type: Type) {
        fetchGitHubAPIClientRepositoryCreater = {
            switch type {
            case .inMemory:
                return GitHubUserAPIClient(httpClient: URLSession.shared)
            case .real:
                return GitHubUserAPIClient(httpClient: URLSession.shared)
            }
        }
    }
}

extension DIContainer {
    static func fetchGitHubAPIClientRepository() -> FetchGitHubAPIClientRepository {
        fetchGitHubAPIClientRepositoryCreater()
    }
}
