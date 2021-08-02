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
    //private weak var signUpView: SignUpView?
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
        var loginOutput = factory.makeAuthView()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onRestorePasswordButtonTap = { [weak self] in
            self?.showRestoreView()
        }
        router.setRootModule(loginOutput)
    }
    
    private func showSignUpView() {
        var signUpView = factory.makeSignUpView()
        signUpView.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpView)
    }
    
    private func showRestoreView() {
        //        signUpView = factory.makeSignUpHandler()
        //        signUpView?.onSignUpComplete = { [weak self] in
        //            self?.finishFlow?()
        //        }
        //        signUpView?.onTermsButtonTap = { [weak self] in
        //            self?.showTerms()
        //        }
        //        router.push(signUpView)
    }
    
//    private func showTerms() {
//        let termsOutput = factory.makeTermsOutput()
//        termsOutput.confirmed = self.signUpView?.confirmed ?? false
//        
//        termsOutput.onConfirmChanged = { [weak self] confirmed in
//            self?.signUpView?.conformTermsAgreement(confirmed)
//        }
//        router.push(termsOutput, animated: true)
//    }
    
    private func isItFirstAuth() -> Bool {
        return true
    }
}
