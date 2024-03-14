//
//  ModuleBetaView.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

final class ModuleGammaView: UIView, UITextFieldDelegate {
    
    struct Model {
        let text: String
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Waiting..."
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name ..."
        textField.borderStyle = .line
        textField.returnKeyType = .continue
        textField.delegate = self
        return textField
    }()

    private let presenter: ModuleGammaPresenterProtocol

    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleGammaView.Model) {
        label.text = model.text
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let name = textField.text else { return false }
        presenter.getName(name: name)
        return true
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

private extension ModuleGammaView {

    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        addSubview(label)
        addSubview(textField)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.widthAnchor.constraint(equalToConstant: 280),
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
