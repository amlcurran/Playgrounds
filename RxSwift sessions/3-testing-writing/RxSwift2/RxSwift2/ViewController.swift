import UIKit
import RxSwift

class ViewController: UIViewController {

    private var observableFactory: TextFieldObservableFactory!
	private var sliderObservableFactory: SliderObservableFactory!
    private var disposeBag = DisposeBag()
	private let textField = UITextField()
	private let button = UIButton()
	private let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
		edgesForExtendedLayout = []

		textField.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
		layout(textField)

		button.setTitle("Button", for: .normal)
		button.setTitleColor(.red, for: .normal)
		button.setTitleColor(.gray, for: .disabled)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		layout(button, below: textField)

		slider.minimumValue = 1
		slider.maximumValue = 10
		slider.isContinuous = true
		layout(slider, below: button)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		disposeBag = DisposeBag()

		// task one, disable the button if there are fewer than 8 characters
		observableFactory = TextFieldObservableFactory(textField: textField)
		observableFactory.observable
				.subscribe(onNext: { string in
					print(string)
				})
				.addDisposableTo(disposeBag)

		sliderObservableFactory = SliderObservableFactory(slider: slider)
		sliderObservableFactory.observable
				.subscribe(onNext: { float in print(float) })
				.addDisposableTo(disposeBag)

		textField.text = "Hello"
		slider.value = 8
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		disposeBag = DisposeBag()
	}

	@objc private func buttonTapped() {
		print("Tapped button!")
	}

	private func layout(_ textField: UITextField) {
		view.addSubview(textField)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		textField.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 16).isActive = true
		textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}

	private func layout(_ firstView: UIView, below otherView: UIView) {
		view.addSubview(firstView)
		firstView.translatesAutoresizingMaskIntoConstraints = false
		firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		firstView.topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: 16).isActive = true
	}

}
