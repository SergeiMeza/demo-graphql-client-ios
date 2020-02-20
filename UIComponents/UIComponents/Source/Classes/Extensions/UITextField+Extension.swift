import UIKit
import RxSwift
import RxCocoa

extension UITextField {
  
  @discardableResult
  public func delegate(_ delegateObject: UITextFieldDelegate) -> UITextField {
    self.delegate = delegateObject
    return self
  }
  
  @discardableResult
  public func placeholder(_ text: String) -> UITextField {
    self.placeholder = text
    return self
  }
  
  @discardableResult
  public func textType(_ type: UITextField.TextType) -> UITextField {
    self.textType = type
    return self
  }
  
  @discardableResult
  public func textContentType(_ contentType: UITextContentType) -> UITextField {
    self.textContentType = contentType
    return self
  }
  
  @discardableResult
  public func passwordRules(_ rules: UITextInputPasswordRules) -> UITextField {
    self.passwordRules = rules
    return self
  }
  
  @discardableResult
  public func tint(_ color: UIColor) -> UITextField {
    self.tintColor = color
    return self
  }
  
  @discardableResult
  public func leftIcon(_ image: UIImage, padding: CGFloat) -> UITextField {
    self.addPaddingLeftIcon(image, padding: padding)
    return self
  }
}


extension UITextField {
  @discardableResult
  public func onTextChange(handler: @escaping (_ text: String) -> (), disposeBag: DisposeBag) -> UITextField {
    self.rx.text
      .orEmpty
      .distinctUntilChanged()
      .subscribe(onNext: handler)
      .disposed(by: disposeBag)
    return self
  }
}
