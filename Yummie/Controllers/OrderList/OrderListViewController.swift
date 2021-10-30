//
//  OrderListViewController.swift
//  Yummie
//
//  Created by Pratyush  on 10/25/21.
//

import UIKit

class OrderListViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 102
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.identifier)
        return tableView
    }()
    
    var orders: [Order]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addAllSubviews()
        registerTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.backItem?.backButtonTitle = " "
    }

}

//MARK: - Private Helpers
private extension OrderListViewController {
    
    func addAllSubviews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let orders = orders else {
            return 0
        }
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orders = orders, let dish = orders[indexPath.row].dish else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.configure(with: dish)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let orders = orders else {
            return
        }
        let vc = DishDetailViewController()
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
