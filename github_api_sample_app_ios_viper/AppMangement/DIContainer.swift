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
                return GitHubUserAPIClient(httpClientProtocol: URLSession.shared)
            case .real:
                return GitHubUserAPIClient(httpClientProtocol: URLSession.shared)
            }
        }
    }
}

extension DIContainer {
    static func fetchGitHubAPIClientRepository() -> FetchGitHubAPIClientRepository {
        fetchGitHubAPIClientRepositoryCreater()
    }
}
