//
//  Coordinator.swift
//  MinhasViagens
//
//  Created by Giuliano Accorsi on 20/10/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
