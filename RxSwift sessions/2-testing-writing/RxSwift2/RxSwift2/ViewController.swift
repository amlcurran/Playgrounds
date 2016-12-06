import UIKit
import RxSwift

class ViewController: UIViewController {

    private var observableFactory: TextFieldObservableFactory!
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
		edgesForExtendedLayout = []

        let textField = UITextField()
		textField.text = "Hello"
        view.addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		textField.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true

        observableFactory = TextFieldObservableFactory(textField: textField)
        observableFactory.observable
            .subscribe(onNext: { string in print(string) })
			.addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

