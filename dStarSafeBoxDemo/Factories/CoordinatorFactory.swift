//
//  CoordinatorFactory.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 01.08.2021.
//

import UIKit

protocol CoordinatorFactory {
  
  func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput

  func makeHomeCoordinator(router: Router) -> Coordinator & HomeCoordinatorOutput
}

