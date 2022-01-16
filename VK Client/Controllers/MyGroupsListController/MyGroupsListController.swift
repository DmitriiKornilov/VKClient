//
//  MyGroupsListController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

class MyGroupsListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifierUniversalTableViewCell =
    "reuseIdentifierUniversalTableViewCell"
    var myGroups = [Group]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier:
                            reuseIdentifierUniversalTableViewCell)
    }
    
}
