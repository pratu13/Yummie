//
//  HomeViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/20/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var section1titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Food Categories"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    private var section2titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Dishes"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    private var section3titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chef's Special"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    private var section1View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var section2View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var section3View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var section1collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.backgroundColor = .blue
        return colletionView
    }()
    
    private var section2collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.backgroundColor = .red
        return colletionView
    }()
    
    private var section3collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.backgroundColor = .yellow
        return colletionView
    }()
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var containerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpNavigationBar()
        addAllSubviews()
    }
}

//MARK: - Private Helpers
private extension HomeViewController {
    
    func addAllSubviews() {
        view.addSubview(containerScrollView)
        containerScrollView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        containerScrollView.addSubview(containerStackView)
        containerStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        containerStackView.addArrangedSubview(section1View)
        containerStackView.addArrangedSubview(section2View)
        containerStackView.addArrangedSubview(section3View)
        setupSection1()
        setupSection2()
        setupSection3()
    }
    
    func setupSection1() {
        section1View.addSubview(section1titleLabel)
        section1View.addSubview(section1collectionView)
        section1titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
        }
        section1collectionView.snp.makeConstraints { make in
            make.top.equalTo(section1titleLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(122)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupSection2() {
        section2View.addSubview(section2titleLabel)
        section2View.addSubview(section2collectionView)
        section2titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
        }
        section2collectionView.snp.makeConstraints { make in
            make.top.equalTo(section2titleLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(300)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupSection3() {
        section3View.addSubview(section3titleLabel)
        section3View.addSubview(section3collectionView)
        section3titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
        }
        section3collectionView.snp.makeConstraints { make in
            make.top.equalTo(section3titleLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
        }
    }
    
    func setUpNavigationBar() {
        title = "Yummie"
        navigationController?.navigationBar.tintColor = .black
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .done, target: self, action: #selector(didTapCartButton))
        cartButton.tintColor = .systemRed
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc func didTapCartButton() {
        
    }
    
}


