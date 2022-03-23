import Foundation

protocol GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController)
}

class GitHubUserListConfiguratorImpl: GitHubUserListConfigurator {
    func configure(dependency: GitHubUserListViewController) {
        let router = GitHubUserListRouterImpl(view: dependency)
        let presenter = GitHubUserListPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
