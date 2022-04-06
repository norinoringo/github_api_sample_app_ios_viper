import Foundation
import UIKit

protocol AccessTokenInputRouter {
    func gotoTop()
    func gotoGitHubUserList(accessToken: String)
}

class AccessTokenInputRouterImpl: AccessTokenInputRouter {
    let viewController: AccessTokenInputViewController

    init(view: AccessTokenInputViewController) {
        viewController = view
    }

    func gotoTop() {
        guard let nextView = R.storyboard.top.instantiateInitialViewController() else { return }
        let configurator = TopConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }

    func gotoGitHubUserList(accessToken: String) {
        guard let nextView = R.storyboard.gitHubUserList.instantiateInitialViewController() else { return }
        let configurator = GitHubUserListConfiguratorImpl()
        configurator.configure(dependency: nextView)
        nextView.accessToken = accessToken
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
