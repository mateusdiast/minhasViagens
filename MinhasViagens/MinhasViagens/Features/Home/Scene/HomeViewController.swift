//
//  HomeViewController.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 19/10/24.
//

import UIKit

protocol HomeViewControllerDisplayble: AnyObject {
    func displayState(_ state: HomeView.State)
    func displayMatchDetail()
}

final class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelLogic
    private let contentView: HomeViewProtocol
    private let coordinator: HomeCoordinating

    init(
        viewModel: HomeViewModelLogic,
        contentView: HomeViewProtocol,
        coordinator: HomeCoordinating
    ) {
        self.viewModel = viewModel
        self.contentView = contentView
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
        contentView.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        self.title = "Home"
    }
}

extension HomeViewController: HomeViewControllerDisplayble {
    func displayState(_ state: HomeView.State) {
        contentView.changeState(state)
    }
    
    func displayMatchDetail() {
        coordinator.showMatchDetail()
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapButton() {
        viewModel.changeText()
    }
}
