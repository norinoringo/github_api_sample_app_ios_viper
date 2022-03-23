import Foundation
import UIKit

protocol GitHubUserListRouter {
    func gotoTop()
}

class GitHubUserListRouterImpl: GitHubUserListRouter {
    let viewController: GitHubUserListViewController

    init(view: GitHubUserListViewController) {
        viewController = view
    }

    func gotoTop() {
        guard let nextView = R.storyboard.top.instantiateInitialViewController() else { return }
        let configurator = TopConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
