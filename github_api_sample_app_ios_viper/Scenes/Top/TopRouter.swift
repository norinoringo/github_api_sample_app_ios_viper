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
        guard let nextView = R.storyboard.inputSearchRepositoryKeyword.instantiateInitialViewController() else { return }
        let configurator = InputSearchRepositoryKeywordConfiguratorImpl()
        configurator.configure(dependency: nextView)
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
