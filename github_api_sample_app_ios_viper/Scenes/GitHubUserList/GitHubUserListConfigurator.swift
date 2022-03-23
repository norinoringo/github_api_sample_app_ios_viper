import Foundation

protocol GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController)
}

class GitHubUserListConfiguratorImpl: GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController) {
        let fetchGitHubUserListRepository = DIContainer.fetchGitHubUserListRepository()
        let router = GitHubUserListRouterImpl(view: dependency)
        let presenter = GitHubUserListPresenterImpl(view: dependency,
                                                    router: router,
                                                    fetchGitHubUserListUseCase: FetchGitHubUserListUseCase(repository: fetchGitHubUserListRepository))
        dependency.presenter = presenter
    }
}
