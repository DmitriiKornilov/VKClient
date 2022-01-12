//
//  AllGroupsListController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 05.01.2022.
//

import UIKit

class AllGroupsListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let reuseIdentifierUniversalTableViewCell =
    "reuseIdentifierUniversalTableViewCell"

    let allGroups = ["Football", "Cinema", "iOS Development", "Apple",
                     "Funny Videos", "DC Comics", "Marvel",
                     "World of Warcraft Guides", "Ozon Sales"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell",
                                 bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
}
