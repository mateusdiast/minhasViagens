//
//  HomeFactory.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 19/10/24.
//

import Foundation

enum HomeFactory {
    static func make(coordinator: HomeCoordinating) -> HomeViewController {
        let homeView = HomeView()
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(
            viewModel: viewModel,
            contentView: homeView,
            coordinator: coordinator
        )
        viewModel.display = viewController

        return viewController
    }
}
