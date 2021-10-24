//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/24/21.
//

import UIKit

final class DishDetailViewController: UIViewController {

    private var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    private var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private var label1: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private var label2: UILabel = {
        let label = UILabel()
        label.text = "Calorie"
        label.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        label.textAlignment = .right
        label.textColor = .systemRed
        label.autoresizingMask = .flexibleRightMargin
        return label
    }()
    
    private var label3: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Your text")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10.0
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        button.setTitle("Place Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBrown
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addAllSubviews()
    }

}

//MARK: - Private Helpers
private extension DishDetailViewController {
    
    func addAllSubviews() {
        view.addSubview(imageView)
        view.addSubview(vStackView)
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        hStackView.addArrangedSubview(label1)
        hStackView.addArrangedSubview(label2)
        vStackView.addArrangedSubview(hStackView)
        vStackView.addArrangedSubview(label3)
        vStackView.addArrangedSubview(textField)
        vStackView.addArrangedSubview(button)
    }
}
