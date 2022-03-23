import Foundation

protocol GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController)
}

class GitHubUserRepositoryConfiguratorImpl: GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController) {
        let fetchGitHubUserDetailRepository = DIContainer.fetchGitHubUserDetail()
        let fetchGitHubUserRepositoryRepository = DIContainer.fetchGitHubUserRepositoryRepository()
        let router = GitHubUserRepositoryRouterImpl(view: dependency)
        let presenter = GitHubUserRepositoryPresenterImpl(view: dependency,
                                                          router: router,
                                                          fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase(repository: fetchGitHubUserDetailRepository),
                                                          fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryUseCase(repository: fetchGitHubUserRepositoryRepository))
        dependency.presenter = presenter
    }
}
