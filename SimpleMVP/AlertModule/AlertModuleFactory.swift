import UIKit

final class AlertModuleFactory {

    func showAlertSaveResult(title: String, message: String) -> UIAlertController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )

        alertViewController.addAction(action)

        return alertViewController
    }

    func make(title: String, message: String, completion: @escaping () -> ()) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "Ok",
            style: .default) { ok in
                completion()
            }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        alertViewController.addAction(action)
        alertViewController.addAction(cancel)

        return alertViewController
    }
}
