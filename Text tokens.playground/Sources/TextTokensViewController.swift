
import UIKit

public class TextTokensViewController: UIViewController {
    public private(set) var textView = UITextView()
    public private(set) var accessoryStackView = UIStackView()
    public private(set) var endEditingButton = UIButton()
    
    public var tokens: [String] = [] {
        didSet {
            tokensLabel.text = tokens.joined(separator: "\n")
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
    }
    
    private func setUpViews() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        tokensLabel.translatesAutoresizingMaskIntoConstraints = false
        tokensLabel.backgroundColor = .black
        tokensLabel.textColor = .white
        tokensLabel.numberOfLines = -1
        view.addSubview(tokensLabel)
        
        accessoryStackView.translatesAutoresizingMaskIntoConstraints = false
        accessoryStackView.axis = .vertical
        view.addSubview(accessoryStackView)
        
        endEditingButton.setTitle("End editing", for: .normal)
        endEditingButton.setTitleColor(.lightText, for: .highlighted)
        endEditingButton.addTarget(self, action: #selector(didTapEndEditingButton(_:)), for: .touchUpInside)
        accessoryStackView.addArrangedSubview(endEditingButton)
    }
    
    @objc func didTapEndEditingButton(_ sender:UIButton!) {
        textView.endEditing(false)
    }
    
    private lazy var tokensLabel = UILabel()
    
    private func setUpConstraints() {
        tokensLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tokensLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        accessoryStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        accessoryStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        
        tokensLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        textView.bottomAnchor.constraint(equalTo: tokensLabel.topAnchor, constant: -10).isActive = true
        
        tokensLabel.trailingAnchor.constraint(equalTo: accessoryStackView.leadingAnchor, constant: -5).isActive = true
        
        tokensLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -15).isActive = true
        
        accessoryStackView.topAnchor.constraint(equalTo: tokensLabel.topAnchor).isActive = true
    }
}

