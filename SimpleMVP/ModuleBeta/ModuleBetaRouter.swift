//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {

    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)

    func showAlert(onAction: @escaping () -> () )
    func showSuccess()
    func showError()
    func openModuleGamma(with param: String, moduleBetaPresenter: ModuleBetaPresenterProtocol)
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
    weak var root: UIViewController?

    private let alertFactory: AlertModuleFactory
    private let factory: ModuleGammaFactory

    init(alertFactory: AlertModuleFactory, factory: ModuleGammaFactory) {
        self.alertFactory = alertFactory
        self.factory = factory
    }

    func setRootViewController(root: UIViewController) {
        self.root = root
    }

    // Модуль Beta показывает модуль Gamma и передает в него параметры.
    func openModuleGamma(with param: String, moduleBetaPresenter: ModuleBetaPresenterProtocol) {
        let context = ModuleGammaFactory.Context(
            someParam: param,
            someValue: 50
        )

        let viewController = factory.make(context: context, moduleBetaPresenter: moduleBetaPresenter)
        root?.navigationController?.pushViewController(viewController, animated: true)
    }

    func showAlert(onAction: @escaping () -> () ) {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save changes?") {
                onAction()
            }
        root?.present(viewController, animated: true)
    }

    func showSuccess() {
        let viewController = alertFactory.showAlertSaveResult(
            title: "Module Beta",
            message: "Save success"
        )
        root?.present(viewController, animated: true)
    }

    func showError() {
        let viewController = alertFactory.showAlertSaveResult(
            title: "Module Beta",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
}
