//
//  SceneDelegate.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 19/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: HomeCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()

        coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator?.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

