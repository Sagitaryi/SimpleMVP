//
//  ModuleBetaView.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

final class ModuleBetaView: UIView {
    
    struct Model {
        let text: String
    }

    var text: String = ""

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Waiting..."
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        return button
    }()

    private lazy var buttonShowGammaScreen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show GammaScreen", for: .normal)
        button.addTarget(self, action: #selector(showGammaScreen), for: .touchUpInside)
        return button
    }()

    private let presenter: ModuleBetaPresenterProtocol

    init(presenter: ModuleBetaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleBetaView.Model) {
        label.text = model.text
    }
    
    func showError() {
        // Показываем View ошибки
    }
    
    func showEmpty() {
        // Показываем какой-то View для Empty state
    }
    
    func startLoader() {
        // Показываем скелетон или лоадер
    }
    
    func stopLoader() {
        // Скрываем все
    }
}

private extension ModuleBetaView {
    
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(label)
        addSubview(button)
        addSubview(buttonShowGammaScreen)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonShowGammaScreen.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            button.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            button.widthAnchor.constraint(equalToConstant: 100.0),

            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),

            buttonShowGammaScreen.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
            buttonShowGammaScreen.widthAnchor.constraint(equalToConstant: 150.0),
            buttonShowGammaScreen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
        ])
    }    
    
    @objc
    func onTapped() {
        presenter.showAlert()
    }

    @objc
    func showGammaScreen() {
        presenter.tapButton()
    }

    
}
