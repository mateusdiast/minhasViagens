//
//  HomeCoordinator.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 20/10/24.
//

import UIKit

protocol HomeCoordinating {
    func showMatchDetail()
}

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.navigationBar.prefersLargeTitles = true

        let viewController = HomeFactory.make(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinating {
    func showMatchDetail() {
        //TODO: Adicionar Fluxo de Detalhe
    }
}
