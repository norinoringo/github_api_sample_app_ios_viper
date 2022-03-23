import Foundation
import UIKit

protocol GitHubUserRepositoryRouter {
    func gotoTop()
}

class GitHubUserRepositoryRouterImpl: GitHubUserRepositoryRouter {
    let viewController: GitHubUserRepositoryViewController

    init(view: GitHubUserRepositoryViewController) {
        viewController = view
    }

    func gotoTop() {
        guard let nextView = R.storyboard.top.instantiateInitialViewController() else { return }
        let configurator = TopConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
