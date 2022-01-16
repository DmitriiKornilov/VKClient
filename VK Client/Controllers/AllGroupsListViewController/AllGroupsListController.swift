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

    var allGroups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell",
                                 bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
}
