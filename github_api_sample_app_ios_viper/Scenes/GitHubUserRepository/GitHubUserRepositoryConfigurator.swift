import Foundation

protocol GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController)
}

class GitHubUserRepositoryConfiguratorImpl: GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController) {
        let fetchGitHubAPIClientRepository = DIContainer.fetchGitHubAPIClientRepository()
        let router = GitHubUserRepositoryRouterImpl(view: dependency)
        let presenter = GitHubUserRepositoryPresenterImpl(view: dependency,
                                                          router: router,
                                                          fetchGitHubUserDetailUseCase: FetchGitHubUserDetailUseCase(repository: fetchGitHubAPIClientRepository),
                                                          fetchGitHubUserRepositoryUseCase: FetchGitHubUserRepositoryListUseCase(repository: fetchGitHubAPIClientRepository))
        dependency.presenter = presenter
    }
}
