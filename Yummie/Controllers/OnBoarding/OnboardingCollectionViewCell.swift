//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Pratyush  on 10/18/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    public static let identifier: String  = {
        return "OnboardingCollectionViewCell"
    }()
    
    private var slideImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private var textStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 10.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        addAllSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: OnboardingSlideModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        slideImageView.image = model.image
    }
    
}

//MARK: - Private Helpers
private extension OnboardingCollectionViewCell {
    
    func addAllSubviews() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(slideImageView)
        contentView.addSubview(textStackView)
        layoutSubViews()
    }
    
    func layoutSubViews() {
        
        slideImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(textStackView.snp.top).inset(40)
        }
        
        textStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
//            make.top.equalTo(slideImageView.snp.bottom)
        }
    }
    
    
}
