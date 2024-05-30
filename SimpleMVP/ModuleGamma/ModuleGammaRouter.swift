//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleGammaRouterProtocol {
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
}

final class ModuleGammaRouter: ModuleGammaRouterProtocol {

    weak var root: UIViewController?

    private let alertFactory: AlertModuleFactory

    init(alertFactory: AlertModuleFactory) {
        self.alertFactory = alertFactory
    }

    func setRootViewController(root: UIViewController) {
        self.root = root
    }
}
