//
//  HomeViewModel.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 19/10/24.
//

import Foundation

protocol HomeViewModelLogic {
    func changeText()
    func viewDidLoad()
}

final class HomeViewModel {
    weak var display: HomeViewControllerDisplayble?
    init() {}
}

extension HomeViewModel: HomeViewModelLogic {
    func changeText() {
        display?.displayState(.hasData("Mudou! :)"))
    }

    func viewDidLoad() {
        display?.displayState(.hasData("teste"))
    }
}
