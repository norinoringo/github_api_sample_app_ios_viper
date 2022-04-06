import Foundation

protocol GitHubRepositoryListConfigurator {
    func configure(dependency: GitHubRepositoryListViewController)
}

class GitHubRepositoryListConfiguratorImpl: GitHubRepositoryListConfigurator {
    func configure(dependency: GitHubRepositoryListViewController) {
        let fetchGitHubAPIClientRepository = DIContainer.fetchGitHubAPIClientRepository()
        let router = GitHubRepositoryListRouterImpl(view: dependency)
        let presenter = GitHubRepositoryListPresenterImpl(view: dependency,
                                                          router: router,
                                                          fetchGitHubRepositoryUseCase: FetchGitHubRepositoryListUseCase(repository: fetchGitHubAPIClientRepository))
        dependency.presenter = presenter
    }
}
