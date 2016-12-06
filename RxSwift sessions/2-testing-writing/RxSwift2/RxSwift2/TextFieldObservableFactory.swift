import UIKit
import RxSwift

class TextFieldObservableFactory: NSObject, UITextFieldDelegate {

    private let subject = PublishSubject<String>()
    private weak var textField: UITextField?

    init(textField: UITextField) {
        self.textField = textField
		super.init()
        self.textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

	var observable: Observable<String> {
        return subject.asObservable()
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        subject.on(.next(text))
    }

}
