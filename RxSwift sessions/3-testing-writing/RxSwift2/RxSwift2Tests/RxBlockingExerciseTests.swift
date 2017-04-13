import XCTest
import RxSwift
import RxBlocking

class RxBlockingExerciseTests: XCTestCase {
    
    func testWhenThereIsNoUsername_ThenTheUsernameErrorIsEmitted() {
        
    }
    
    func testWhenThereIsAUsernameButAShortPasswordWeGetTheShortPasswordError() {
        
    }
    
    func testWhenThereIsAUsernameAndAGoodPasswordThereIsNoErrorText() {
        
    }
    
    func testWhenTheUsernameIsChangedAndThereIsAGoodPasswordThereIsNoSecondErrorText() {
        let usernameObservable = Observable.of(false, true)
        let passwordLengthObservable = Observable.of(9)
        
        
    }
    
}

func create(usernameFilled: Observable<Bool>, passwordLength: Observable<Int>) -> Observable<String?> {
    return Observable.combineLatest(usernameFilled, passwordLength, resultSelector: errorText)
}

private func errorText(hasUsername: Bool, passwordLength: Int) -> String? {
    if !hasUsername {
        return "You need to put in a username"
    }
    if passwordLength > 8 {
        return "Your password needs to be more that 8 characters"
    }
    return nil
}
