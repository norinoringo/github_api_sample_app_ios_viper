import Foundation

class DIContainer {
    private static var fetchGitHubUserListRepositoryCreater: (() -> FetchGitHubUserListRepository)!
}

extension DIContainer {
    enum `Type` {
        case real
        case inMemory
    }

    static func setup(type: Type) {
        fetchGitHubUserListRepositoryCreater = {
            switch type {
            case .inMemory:
                return GitHubUserListClient()
            case .real:
                return GitHubUserListClient()
            }
        }
    }
}

extension DIContainer {
    static func fetchGitHubUserListRepository() -> FetchGitHubUserListRepository {
        fetchGitHubUserListRepositoryCreater()
    }
}
