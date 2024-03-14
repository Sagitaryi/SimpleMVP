import Foundation

protocol ModuleBetaPresenterProtocol {
    var title: String { get }

//    func viewDidLoad()
    func viewWillLayoutSubviews()
    func setSomeParam(completion: () -> (String))
    func showAlert()
    func requestSave()
    func tapButton()
}

final class ModuleBetaPresenter: ModuleBetaPresenterProtocol {
    
    weak var view: ModuleBetaViewProtocol?
    
    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleBetaRouterProtocol
    private var someParam: String

    var title: String { "Module B" }
    
    var analiticScreenName: String { "super_b" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleBetaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }
    
    deinit {
        print(">>> ModuleBetaPresenter is deinit")
    }

    func setSomeParam(completion: () -> (String)) {
        someParam = completion()
        viewWillLayoutSubviews()
    }

    func viewWillLayoutSubviews() {
        let model = ModuleBetaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }

    func showAlert() {
        router.showAlert(onAction: requestSave)
    }

    func requestSave() {
        dataBaseService.storeData(value: someParam) { [weak self] (result: Result<Void, Error>) in
            guard let self else { return }
            
            switch result {
            case .success:
                router.showSuccess()
            case .failure:
                router.showError()
            }
        }
    }

    func tapButton() {
        // открыть модуль Gamma и передать туда параметры
        router.openModuleGamma(with: "params from module Beta", moduleBetaPresenter: self)
    }
}
