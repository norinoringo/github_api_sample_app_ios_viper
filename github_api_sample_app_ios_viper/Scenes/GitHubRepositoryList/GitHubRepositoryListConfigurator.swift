import Foundation

protocol GitHubRepositoryListConfigurator {
    func configure(dependency: GitHubRepositoryListViewController)
}

class GitHubRepositoryListConfiguratorImpl: GitHubRepositoryListConfigurator {
    func configure(dependency: GitHubRepositoryListViewController) {
        let router = GitHubRepositoryListRouterImpl(view: dependency)
        let presenter = GitHubRepositoryListPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
