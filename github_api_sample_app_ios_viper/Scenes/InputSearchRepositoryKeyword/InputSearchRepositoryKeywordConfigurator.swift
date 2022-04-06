import Foundation

protocol InputSearchRepositoryKeywordConfigurator {
    func configure(dependency: InputSearchRepositoryKeywordViewController)
}

class InputSearchRepositoryKeywordConfiguratorImpl: InputSearchRepositoryKeywordConfigurator {
    func configure(dependency: InputSearchRepositoryKeywordViewController) {
        let router = InputSearchRepositoryKeywordRouterImpl(view: dependency)
        let presenter = InputSearchRepositoryKeywordPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
