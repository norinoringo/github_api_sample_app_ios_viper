import Foundation

protocol TopConfigurator {
    func configure(dependency: TopViewController)
}

class TopConfiguratorImpl: TopConfigurator {
    func configure(dependency: TopViewController) {
        let router = TopRouterImpl(view: dependency)
        let presenter = TopPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
