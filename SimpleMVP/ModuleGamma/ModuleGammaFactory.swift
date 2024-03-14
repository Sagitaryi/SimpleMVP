//
//  ModuleBetaFactory.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

/// Фабрика для создания модуля Beta
final class ModuleGammaFactory {

    // В структуре параметры, которые мы хотим передать в модуль.
    struct Context {
        let someParam: String
        let someValue: Int
    }

    func make(context: Context, moduleBetaPresenter: ModuleBetaPresenterProtocol) -> UIViewController {
        /// Только Factory может наполнять Presenter реальными сервисами и другими зависимостями
        let dataBaseService = DataBaseService()
        
        let router = ModuleGammaRouter(
            alertFactory: AlertModuleFactory(), moduleBetaPresenter: moduleBetaPresenter
        )
        
        let presenter = ModuleGammaPresenter(
            someParam: context.someParam,
            dataBaseService: dataBaseService,
            router: router
        )
        let vc = ModuleGammaViewController(presenter: presenter)
        
        presenter.view = vc
        router.setRootViewController(root: vc)
        
        return vc
    }
}
