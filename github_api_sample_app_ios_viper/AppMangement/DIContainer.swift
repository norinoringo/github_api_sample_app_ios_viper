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
                return GitHubAPIClient(httpClient: StubAPIClient())
            case .real:
                return GitHubAPIClient(httpClient: URLSession.shared)
            }
        }
    }
}

extension DIContainer {
    static func fetchGitHubAPIClientRepository() -> FetchGitHubAPIClientRepository {
        fetchGitHubAPIClientRepositoryCreater()
    }
}
