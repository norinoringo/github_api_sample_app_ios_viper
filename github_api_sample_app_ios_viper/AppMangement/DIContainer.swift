import Foundation

class DIContainer {
    private static var fetchGitHubUserListRepositoryCreater: (() -> FetchGitHubUserListRepository)!
    private static var fetchGitHubUserDetailRepositoryCreater: (() -> FetchGitHubUserDetailRepository)!
    private static var fetchGitHubUserRepositoryRepositoryCreater: (() -> FetchGitHubUserRepositoryRepository)!
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
        fetchGitHubUserDetailRepositoryCreater = {
            switch type {
            case .inMemory:
                return GitHubUserDetailClient()
            case .real:
                return GitHubUserDetailClient()
            }
        }
        fetchGitHubUserRepositoryRepositoryCreater = {
            switch type {
            case .inMemory:
                return GitHubUserRepositoryClient()
            case .real:
                return GitHubUserRepositoryClient()
            }
        }
    }
}

extension DIContainer {
    static func fetchGitHubUserListRepository() -> FetchGitHubUserListRepository {
        fetchGitHubUserListRepositoryCreater()
    }

    static func fetchGitHubUserDetail() -> FetchGitHubUserDetailRepository {
        fetchGitHubUserDetailRepositoryCreater()
    }

    static func fetchGitHubUserRepositoryRepository() -> FetchGitHubUserRepositoryRepository {
        fetchGitHubUserRepositoryRepositoryCreater()
    }
}
