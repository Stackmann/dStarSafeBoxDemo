//
//  ApplicationCoordinator.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 02.08.2021.
//

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
  case main, auth, onboarding
  
  static func configure(
    tutorialWasShown: Bool = onboardingWasShown,
    isAutorized: Bool = isAutorized) -> LaunchInstructor {
    
    switch (tutorialWasShown, isAutorized) {
      case (true, false), (false, false): return .auth
    default: return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator {
  
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }
  
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    // default start
      switch instructor {
      case .onboarding: runOnboardingFlow()
      case .auth: runAuthFlow()
      case .main: runMainFlow()
      }
  }
  
  private func runAuthFlow() {
    let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] in
      isAutorized = true
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
  
  private func runOnboardingFlow() {
//    let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      onboardingWasShown = true
//      self?.start()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    coordinator.start()
  }
  
    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeHomeCoordinator(router: router)
        coordinator.openActivityFlow = { [weak self, weak coordinator] in
            isAutorized = false
            self?.start() //!!! RECONSIDERATE
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

}
