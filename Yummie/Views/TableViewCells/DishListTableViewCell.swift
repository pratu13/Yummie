//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Pratyush  on 10/25/21.
//

import UIKit

final class DishListTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        return String(describing: DishListTableViewCell.self)
    }

    private var containerView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        imageView.layer.cornerRadius = 10.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var label1: UILabel = {
        let label = UILabel()
        label.text = "Label 1"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private var label2: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        addAllSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with dish: Dish) {
        guard let title = dish.name,  let des = dish.description, let image = dish.image else {
            return
        }
        label1.text = title
        label2.text = des
        dishImageView.kf.setImage(with: URL(string: image))
    }
    
    
    public func configure(with order: Order) {
        guard let title = order.dish?.name,  let des = order.dish?.description, let image = order.dish?.image else {
            return
        }
        label1.text = title
        label2.text = des
        dishImageView.kf.setImage(with: URL(string: image))
    }
    

    
    
}


//MARK: - Private Helpers
private extension DishListTableViewCell {
    
    func addAllSubviews() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        containerView.addSubview(dishImageView)
        dishImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(16)
        }
        containerView.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(dishImageView)
            make.leading.equalTo(dishImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        vStackView.addArrangedSubview(label1)
        vStackView.addArrangedSubview(label2)  
    }
}
