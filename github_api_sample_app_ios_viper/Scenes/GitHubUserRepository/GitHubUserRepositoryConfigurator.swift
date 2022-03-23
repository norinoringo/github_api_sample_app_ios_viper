import Foundation

protocol GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController)
}

class GitHubUserRepositoryConfiguratorImpl: GitHubUserRepositoryConfigurator {
    func configure(dependency: GitHubUserRepositoryViewController) {
        let router = GitHubUserRepositoryRouterImpl(view: dependency)
        let presenter = GitHubUserRepositoryPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
