//
//  HomeCoordinator.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

final class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    
    var openActivityFlow: (() -> Void)?
    
    private let factory: HomeModuleFactory
    private let router: Router
    //private weak var signUpView: SignUpView?
    
    init(router: Router, factory: HomeModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showMainView()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showMainView() {
        var homeView = factory.makeHomeView()
        homeView.openActivityFlow = openActivityFlow
        router.setRootModule(homeView) // !!! reconsiderate
    }
}
