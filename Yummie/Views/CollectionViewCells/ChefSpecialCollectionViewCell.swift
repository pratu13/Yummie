//
//  ChefSpecialCollectionViewCell.swift
//  Yummie
//
//  Created by Pratyush  on 10/22/21.
//

import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    
    public static var identifier: String {
        return String(describing: ChefSpecialCollectionViewCell.self)
    }
    
    private var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
        }
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 10.0
        return imgView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private var captionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private var hStackView: UIStackView = {
        let stackView =  UIStackView()
        stackView.spacing = 10
        return stackView
    }()
    
    private var vStackView: UIStackView = {
        let stackView =  UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
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
        captionLabel.text = dish.formattedCalories
        descriptionLabel.text = des
        imageView.kf.setImage(with: URL(string: image))
    }
    
}

//MARK: - Private Helpers
private extension ChefSpecialCollectionViewCell {
    
    func addAllSubviews() {
        contentView.addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hStackView.addArrangedSubview(imageView)
        hStackView.addArrangedSubview(vStackView)
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(captionLabel)
        vStackView.addArrangedSubview(descriptionLabel)
    }
    
}
