import Foundation
import UIKit

protocol TopRouter {
    func gotoGitHubUserList()
    func gotoGitHubRepositoryList()
}

class TopRouterImpl: TopRouter {
    let viewController: TopViewController

    init(view: TopViewController) {
        viewController = view
    }

    func gotoGitHubUserList() {
        guard let nextView = R.storyboard.acessTokenInput.instantiateInitialViewController() else { return }
        let configurator = AccessTokenInputConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }

    func gotoGitHubRepositoryList() {
        // 暫定的にTopViewへ遷移させている
        guard let nextView = R.storyboard.top.instantiateInitialViewController() else { return }
        let configurator = TopConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
