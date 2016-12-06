import UIKit
import RxSwift

class ViewController: UIViewController {

    private var observableFactory: TextFieldObservableFactory!
	private var sliderObservableFactory: SliderObservableFactory!
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
		edgesForExtendedLayout = []

        let textField = UITextField()
		textField.text = "Hello"
		layout(textField)

		let button = UIButton()
		button.setTitle("Button", for: .normal)
		button.setTitleColor(.red, for: .normal)
		layout(button, below: textField)

		let slider = UISlider()
		slider.minimumValue = 1
		slider.maximumValue = 10
		slider.isContinuous = false
		layout(slider, below: button)

        observableFactory = TextFieldObservableFactory(textField: textField)
        observableFactory.observable
            .subscribe(onNext: { string in print(string) })
			.addDisposableTo(disposeBag)

		sliderObservableFactory = SliderObservableFactory(slider: slider)
		sliderObservableFactory.observable
			.subscribe(onNext: { float in print(float) })
			.addDisposableTo(disposeBag)
    }

	private func layout(_ textField: UITextField) {
		view.addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		textField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		textField.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
		textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}

	private func layout(_ button: UIButton, below textField: UIView) {
		view.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
	}

	private func layout(_ slider: UISlider, below button: UIView) {
		view.addSubview(slider)
		slider.translatesAutoresizingMaskIntoConstraints = false
		slider.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		slider.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		slider.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16).isActive = true
	}

}

