import Foundation
import UIKit

protocol InputSearchRepositoryKeywordRouter {
    func gotoGitHubRepositoryList(keyword: String)
}

class InputSearchRepositoryKeywordRouterImpl: InputSearchRepositoryKeywordRouter {
    let viewController: InputSearchRepositoryKeywordViewController

    init(view: InputSearchRepositoryKeywordViewController) {
        viewController = view
    }

    func gotoGitHubRepositoryList(keyword: String) {
        guard let nextView = R.storyboard.gitHubRepositoryList.instantiateInitialViewController() else { return }
        let configurator = GitHubRepositoryListConfiguratorImpl()
        configurator.configure(dependency: nextView)
        nextView.searchKeyword = keyword
        viewController.navigationController?.pushViewController(nextView, animated: true)
    }
}
