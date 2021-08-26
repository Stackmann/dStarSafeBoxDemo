//
//  AuthCoordinator.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: AuthModuleFactory
    private let router: Router
    private var isFirstAuth: Bool {
        isItFirstAuth()
    }
    
    init(router: Router, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        if isFirstAuth {
            showSignUpView()
        } else {
            showAuthView()
        }
    }
    
    //MARK: - Run current flow's controllers
    
    private func showAuthView() {
        var authView = factory.makeAuthView()
        authView.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        authView.onRestorePasswordButtonTap = { [weak self] in
            self?.showRestoreView()
        }
        router.setRootModule(authView) // !!! reconsiderate
    }
    
    private func showSignUpView() {
        var signUpView = factory.makeSignUpView()
        signUpView.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpView)
    }
    
    private func showRestoreView() {
        //call restore view
    }
    
    private func isItFirstAuth() -> Bool {
        return false
    }
}
