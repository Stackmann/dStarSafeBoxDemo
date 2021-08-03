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
//
//  func makeOnboardingModule() -> OnboardingView {
//    return OnboardingController.controllerFromStoryboard(.onboarding)
//  }
//
//  func makeTermsOutput() -> TermsView {
//    return TermsController.controllerFromStoryboard(.auth)
//  }
//
//  func makeItemsOutput() -> ItemsListView {
//    return ItemsListController.controllerFromStoryboard(.items)
//  }
//
//  func makeItemDetailOutput(item: ItemList) -> ItemDetailView {
//
//    let controller = ItemDetailController.controllerFromStoryboard(.items)
//    controller.itemList = item
//    return controller
//  }
//
//  func makeItemAddOutput() -> ItemCreateView {
//    return ItemCreateController.controllerFromStoryboard(.create)
//  }
//
//  func makeSettingsOutput() -> SettingsView {
//    return SettingsController.controllerFromStoryboard(.settings)
//  }
}
