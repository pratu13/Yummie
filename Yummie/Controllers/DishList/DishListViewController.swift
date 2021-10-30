//
//  DishListViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/25/21.
//

import UIKit

final class DishListViewController: UIViewController {

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 102
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.identifier)
        return tableView
    }()
    
    var dishes: [Dish]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addAllSubviews()
        configureTableView()
    }

}

//MARK: - Private helpers
private extension DishListViewController {
    
    func addAllSubviews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Tableview Delegates
extension DishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dishes = dishes else {
            return 0
        }
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dishes = dishes else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.configure(with: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dishes = dishes else {
            return
        }
        let vc = DishDetailViewController()
        vc.dish = dishes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
