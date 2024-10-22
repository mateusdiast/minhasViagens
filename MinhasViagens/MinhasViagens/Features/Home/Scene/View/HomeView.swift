//
//  HomeView.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 19/10/24.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var delegate: HomeViewDelegate? { get set }
    func changeState(_ state: HomeView.State)
}

protocol HomeViewDelegate: AnyObject {
    func didTapButton()
}

final class HomeView: UIView {
    enum State {
        case hasData(String)
        case empty
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var createTextButton: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.setTitle("Adicionar Texto", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textLabel, createTextButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    weak var delegate: HomeViewDelegate?

    init() {
        super.init(frame: .zero)
        additionalSetup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEmptyView(){
        buildEmptyViewHierarchy()
        setupConstraintsEmptyView()
    }
    
    private func setupDataView(){
        buildDataViewHierarchy()
        setupConstraintsDataView()
    }

    private func buildEmptyViewHierarchy() {
        addSubview(stackView)
    }
    
    private func buildDataViewHierarchy() {
        addSubview(tableView)
    }


    private func setupConstraintsEmptyView() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupConstraintsDataView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func additionalSetup() {
        backgroundColor = .white
    }

    @objc private func didTapButton() {
        delegate?.didTapButton()
    }
}

extension HomeView: HomeViewProtocol {
    func changeState(_ state: State) {
        switch state {
        case .hasData(let data):
            setupDataView()
        case .empty:
            setupEmptyView()
        }
    }
}

extension HomeView: UITableViewDelegate {}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

