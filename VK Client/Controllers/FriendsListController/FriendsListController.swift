//
//  FriendsListController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

class FriendsListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let reuseIdentifierUniversalTableViewCell =
    "reuseIdentifierUniversalTableViewCell"
    let fromMyFriendsToGallery = "fromMyFriendsToGallery"

    let searchFriends = Storage.share.friends
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell",
                                 bundle: nil), forCellReuseIdentifier:
                            reuseIdentifierUniversalTableViewCell)
        searchBar.delegate = self
        friends = searchFriends
    }
}


