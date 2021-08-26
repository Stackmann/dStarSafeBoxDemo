//
//  SceneDelegate.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 01.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        applicationCoordinator.start()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    private func makeCoordinator() -> Coordinator {
          return ApplicationCoordinator(
            router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
          )
    }

}

