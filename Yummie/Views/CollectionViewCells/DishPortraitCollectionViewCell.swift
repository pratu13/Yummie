//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Pratyush  on 10/22/21.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    public static var identifier: String {
        return String(describing: DishPortraitCollectionViewCell.self)
    }
    
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private var calorieLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8.0
        return stack
    }()
    
    private var containerView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = false
        addAllSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with dish: Dish) {
        guard let title = dish.name else {
            return
        }
        guard let des = dish.description  else {
            return
        }
        guard let image = dish.image  else {
            return
        }
        titleLabel.text = title
        calorieLabel.text = dish.formattedCalories
        descriptionLabel.text = des
        imageView.kf.setImage(with: URL(string: image))
    }
    
}

//MARK: - Private Helpers
private extension DishPortraitCollectionViewCell {
    
    func addAllSubviews() {
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(calorieLabel)
        vStack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
}
