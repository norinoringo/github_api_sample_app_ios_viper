import Foundation
import UIKit

protocol GitHubUserListRouter {
    func gotoGitHubUserRepository(accessToken: String, githubUser: GitHubUser)
}

class GitHubUserListRouterImpl: GitHubUserListRouter {
    let viewController: GitHubUserListViewController

    init(view: GitHubUserListViewController) {
        viewController = view
    }

    func gotoGitHubUserRepository(accessToken: String, githubUser: GitHubUser) {
        guard let nextView = R.storyboard.gitHubUserRepository.instantiateInitialViewController() else { return }
        let configurator = GitHubUserRepositoryConfiguratorImpl()
        configurator.configure(dependency: nextView)
        nextView.accessToken = accessToken
        nextView.githubUser = githubUser
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
