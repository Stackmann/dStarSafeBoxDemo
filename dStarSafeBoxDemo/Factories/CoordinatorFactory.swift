//
//  CoordinatorFactory.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 01.08.2021.
//

import UIKit

protocol CoordinatorFactory {
  
//  func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
  func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput

  func makeHomeCoordinator(router: Router) -> Coordinator & HomeCoordinatorOutput
    //
//  func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
//  
//  func makeItemCoordinator(navController: UINavigationController?) -> Coordinator
//  func makeItemCoordinator() -> Coordinator
//  
//  func makeSettingsCoordinator() -> Coordinator
//  func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
//  
//  func makeItemCreationCoordinatorBox() ->
//    (configurator: Coordinator & ItemCreateCoordinatorOutput,
//    toPresent: Presentable?)
//  
//  func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
//    (configurator: Coordinator & ItemCreateCoordinatorOutput,
//    toPresent: Presentable?)
}

