import Foundation
import UIKit

protocol InputSearchRepositoryKeywordRouter {}

class InputSearchRepositoryKeywordRouterImpl: InputSearchRepositoryKeywordRouter {
    let viewController: InputSearchRepositoryKeywordViewController

    init(view: InputSearchRepositoryKeywordViewController) {
        viewController = view
    }
}
