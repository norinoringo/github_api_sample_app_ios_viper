import Foundation
import UIKit

protocol GitHubRepositoryListRouter {}

class GitHubRepositoryListRouterImpl: GitHubRepositoryListRouter {
    let viewController: GitHubRepositoryListViewController

    init(view: GitHubRepositoryListViewController) {
        viewController = view
    }
}
