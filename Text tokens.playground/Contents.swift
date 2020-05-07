
import PlaygroundSupport
import UIKit

let tokens = ["hello", "goodbye"]

final class TextViewDelegate: NSObject, UITextViewDelegate {
    var textViewDidChangeClosure: ((UITextView) -> Void)?
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("shouldBeginEditing")
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("didEndEditing")
        return
    }
    
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String) -> Bool
    {
        print("should change")
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textViewDidChangeClosure?(textView)
    }
}
let delegate = TextViewDelegate()
delegate.textViewDidChangeClosure = { textView in
    let textStorage = textView.textStorage
    let range = (textStorage.string as NSString).range(of: textStorage.string)
    textStorage.setAttributes([.backgroundColor: UIColor.blue], range: range)
}

let vc = TextTokensViewController()
vc.tokens = tokens
vc.textView.text = nil
vc.textView.delegate = delegate

vc.view.backgroundColor = .brown
PlaygroundPage.current.liveView = vc
