import Foundation

protocol GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController)
}

class GitHubUserListConfiguratorImpl: GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController) {
        let fetchGitHubAPIClientRepository = DIContainer.fetchGitHubAPIClientRepository()
        let router = GitHubUserListRouterImpl(view: dependency)
        let presenter = GitHubUserListPresenterImpl(view: dependency,
                                                    router: router,
                                                    fetchGitHubUserListUseCase: FetchGitHubUserListUseCase(repository: fetchGitHubAPIClientRepository))
        dependency.presenter = presenter
    }
}
