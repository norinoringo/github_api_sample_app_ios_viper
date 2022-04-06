import Foundation

protocol AcessTokenInputConfigurator {
    func configure(dependency: AccessTokenInputViewController)
}

class AccessTokenInputConfiguratorImpl: AcessTokenInputConfigurator {
    func configure(dependency: AccessTokenInputViewController) {
        let router = AccessTokenInputRouterImpl(view: dependency)
        let presenter = AccessTokenInputPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
