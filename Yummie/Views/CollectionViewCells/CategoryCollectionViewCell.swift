//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Pratyush  on 10/20/21.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: CategoryCollectionViewCell.self)
    }
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
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
    
    public func configure(with dish: DishCategory) {
        label.text = dish.name
        imageView.kf.setImage(with: URL(string: dish.image))
    }
}

//MARK: - Private Helpers
private extension CategoryCollectionViewCell {
    
    func addAllSubviews() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8.0)
            make.width.height.equalTo(40.0)
        }
        containerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8.0)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(imageView.snp.centerY)
        }
        
    }
}
