//
//  CoordinatorFactoryImp.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 01.08.2021.
//

import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        
        let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }
    
    func makeHomeCoordinator(router: Router) -> Coordinator & HomeCoordinatorOutput {
        let coordinator = HomeCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
