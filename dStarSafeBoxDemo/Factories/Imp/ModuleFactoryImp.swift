//
//  ModuleFactoryImp.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

final class ModuleFactoryImp:
    AuthModuleFactory, HomeModuleFactory {
  
    func makeAuthView() -> AuthView {
        return AuthViewController.controllerFromStoryboard(.auth)
    }
    
    func makeSignUpView() -> SignUpView {
        return SignUpViewController.controllerFromStoryboard(.auth)
    }
    
    func makeHomeView() -> HomeView {
        return HomeViewController.controllerFromStoryboard(.home)
    }
    
    func makeSubCategoriesView() -> HomeView {
        return SubCategoriesTableViewController.controllerFromStoryboard(.home)
    }

}
