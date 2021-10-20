//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/17/21.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        return collectionView
    }()
    
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray.withAlphaComponent(0.6)
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()

    private var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black.withAlphaComponent(0.73)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    private var data: [OnboardingSlideModel] = []
    
    private var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == data.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadData()
        pageControl.numberOfPages = data.count
        configureCollectionView()
        addAllSubviews()
    }
    
    @objc private func didTapNextButton() {
        if currentPage == data.count - 1 {
            let homeVC = HomeViewController()
            let navController = UINavigationController(rootViewController: homeVC)
            navController.modalPresentationStyle = .fullScreen
            navController.modalTransitionStyle = .flipHorizontal
            present(navController, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPth = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPth, at: .centeredHorizontally, animated: true)
        }
    }
    
}


//MARK: - Private Helpers
private extension OnboardingViewController {
    
    func addAllSubviews() {
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        layoutSubviews()
    }
    
    func layoutSubviews() {
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).multipliedBy(0.98)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaInsets.top).inset(40)
        }
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func loadData() {
        data.append(OnboardingSlideModel(title: "THIS IS A TITLE", description: "THIS IS A DESCRIPTION", image: UIImage(named: "slide1")!))
        data.append(OnboardingSlideModel(title: "THIS IS A TITLE2", description: "THIS IS A DESCRIPTION2", image: UIImage(named: "slide2")!))
        data.append(OnboardingSlideModel(title: "THIS IS A TITLE3", description: "THIS IS A DESCRIPTION3", image: UIImage(named: "slide3")!))
    }
    
}

//MARK: - UICollection View
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}
