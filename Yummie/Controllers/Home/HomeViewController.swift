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
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.clipsToBounds = false
        return colletionView
        
    }()
    
    private var section2collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(DishPortraitCollectionViewCell.self, forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        return colletionView
    }()
    
    private var section3collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 40)
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(ChefSpecialCollectionViewCell.self, forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        return colletionView
    }()
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var containerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var categories: [DishCategory] = []
    private var dish: [Dish] = []
    private var specials: [Dish] = []
    private var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.myFirstRequest()
        view.backgroundColor = .systemBackground
        setUpNavigationBar()
        addAllSubviews()
        setupCollectionViews()
        loadData()
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
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        section1collectionView.snp.makeConstraints { make in
            make.top.equalTo(section1titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(122)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupSection2() {
        section2View.addSubview(section2titleLabel)
        section2View.addSubview(section2collectionView)
        section2titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        section2collectionView.snp.makeConstraints { make in
            make.top.equalTo(section2titleLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
           //make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupSection3() {
        section3View.addSubview(section3titleLabel)
        section3View.addSubview(section3collectionView)
        section3titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        section3collectionView.snp.makeConstraints { make in
            make.top.equalTo(section3titleLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(120)
            make.bottom.equalToSuperview().inset(10)
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
        let vc = OrderListViewController()
        vc.orders = orders
        vc.title = "Your Orders"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadData() {
        categories = [
            .init(id: "id1", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
            .init(id: "id2", name: "Africa Dish2", image: "https://picsum.photos/100/201"),
            .init(id: "id3", name: "Africa Dish3", image: "https://picsum.photos/100/202"),
            .init(id: "id4", name: "Africa Dish4", image: "https://picsum.photos/100/203"),
            .init(id: "id5", name: "Africa Dish5", image: "https://picsum.photos/100/204")
            
        ]
        dish = [
            .init(id: "id1", name: "Garri ", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/202", calories: 34.545),
            .init(id: "id2", name: "Indomi ", description: "This is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tasted", image: "https://picsum.photos/100/203", calories: 34.525),
            .init(id: "id3", name: "Fired Rice ", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/204", calories: 34.25546),
            .init(id: "id4", name: "Indomi ", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/203", calories: 34.525),
        ]
        
        specials = [
            .init(id: "id1", name: "Fried Plantain", description: "This is my favourtie dish", image: "https://picsum.photos/100/205", calories: 1000.53),
            .init(id: "id2", name: "Beans and Garry", description: "This is my favourtie dish", image: "https://picsum.photos/100/210", calories: 84.32)
        ]
        
        orders = [
            .init(id: "id1", dish: .init(id: "id3", name: "Fired Rice ", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/204", calories: 34.25546), name: "Pratyush"),
            .init(id: "id2", dish: .init(id: "id3", name: "Yam Fried", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/211", calories: 34.25546), name: "Pratyush"),
            
        ]
    }
    
    func setupCollectionViews() {
        section1collectionView.delegate = self
        section1collectionView.dataSource = self
        section2collectionView.delegate = self
        section2collectionView.dataSource = self
        section3collectionView.delegate = self
        section3collectionView.dataSource = self
    }
}


//MARK: - UICollection Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case section1collectionView:
            return categories.count
        case section2collectionView:
            return dish.count
        case section3collectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case section1collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: categories[indexPath.row])
            return cell
        case section2collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.configure(with: dish[indexPath.row])
            return cell
        case section3collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.configure(with: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case section1collectionView:
            return CGSize(width: 150, height: 54)
        case section2collectionView:
            return CGSize(width: 180, height: 450)
        case section3collectionView:
            return CGSize(width: 330, height: 64)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case section1collectionView:
            let vc = DishListViewController()
            vc.title = categories[indexPath.row].name
            vc.dishes = dish
            navigationController?.pushViewController(vc, animated: true)
        case section2collectionView:
            let vc = DishDetailViewController()
            vc.dish = dish[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case section3collectionView:
            break
        default:
            break
        }
    }
}
