//
//  ModuleBetaPresenter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import Foundation

protocol ModuleGammaPresenterProtocol {
    var title: String { get }
    
    func viewDidLoad()
    func getName(name: String)
}

final class ModuleGammaPresenter: ModuleGammaPresenterProtocol {
    weak var view: ModuleGammaViewProtocol?

    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleGammaRouterProtocol
    private let someParam: String

    var title: String { "Module G" }

    var analiticScreenName: String { "super_b" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleGammaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }

    func viewDidLoad() {
        let model = ModuleGammaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }

    func getName(name: String) {
        router.moduleBetaPresenter.setSomeParam {
            return name
        }
    }

    deinit {
        print(">>> ModuleGammaPresenter is deinit")
    }
}
