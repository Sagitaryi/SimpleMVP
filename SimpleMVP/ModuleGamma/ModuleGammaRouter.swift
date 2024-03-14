//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleGammaRouterProtocol {
    var moduleBetaPresenter: ModuleBetaPresenterProtocol { get }
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
}

final class ModuleGammaRouter: ModuleGammaRouterProtocol {

    weak var root: UIViewController?

    private let alertFactory: AlertModuleFactory

    let moduleBetaPresenter: ModuleBetaPresenterProtocol

    init(alertFactory: AlertModuleFactory, moduleBetaPresenter: ModuleBetaPresenterProtocol) {
        self.alertFactory = alertFactory
        self.moduleBetaPresenter = moduleBetaPresenter
    }

    func setRootViewController(root: UIViewController) {
        self.root = root
    }
}
