import Foundation
import UIKit

protocol TopRouter {
    func gotoTop()
    func gotoGitHubUserList(accessToken: String)
}

class TopRouterImpl: TopRouter {
    let viewController: TopViewController

    init(view: TopViewController) {
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
