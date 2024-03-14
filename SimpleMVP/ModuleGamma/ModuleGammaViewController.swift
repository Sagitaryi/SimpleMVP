//
//  ModuleBetaViewController.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleGammaViewProtocol: AnyObject {

    func update(model: ModuleGammaView.Model)
    func showError()
    func showEmpty()
    func startLoader()
    func stopLoader()
}

final class ModuleGammaViewController: UIViewController {

    private lazy var customView = ModuleGammaView(presenter: presenter)
    private let presenter: ModuleGammaPresenterProtocol

    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        title = presenter.title
        presenter.viewDidLoad()
    }

    deinit {
        print(">>> ModuleGammaViewController is deinit")
    }
}

extension ModuleGammaViewController: ModuleGammaViewProtocol {

    func update(model: ModuleGammaView.Model) {
        customView.update(model: model)
    }
    
    func showError() {
        customView.showError()
    }
    
    func showEmpty() {
        customView.showEmpty()
    }
    
    func startLoader() {
        customView.startLoader()
    }
    
    func stopLoader() {
        customView.stopLoader()
    }
}
