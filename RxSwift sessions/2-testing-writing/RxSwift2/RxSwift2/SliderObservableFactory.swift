import UIKit
import RxSwift

class SliderObservableFactory: NSObject {

	private let subject = PublishSubject<Float>()
	private weak var slider: UISlider?

	init(slider: UISlider) {
		self.slider = slider
		super.init()
		self.slider?.addTarget(self, action: #selector(sliderDidChange), for: .valueChanged)
	}

	var observable: Observable<Float> {
		return subject.asObservable()
	}

	@objc private func sliderDidChange(_ slider: UISlider) {
		subject.on(.next(slider.value))
	}

}
