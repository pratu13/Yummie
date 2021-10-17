//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/17/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()

    private var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllSubviews()
    }
    
}


//MARK: - Private Helpers
private extension OnboardingViewController {
    
    func addAllSubviews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(button)
        layoutSubviews()
    }
    
    func layoutSubviews() {
        
    }
    
}
