//
//  FriendsListController + SearchBarDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import Foundation
import UIKit

extension FriendsListController: UISearchBarDelegate {

    //метод поиска
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            friends = searchFriends
        } else {
            friends = searchFriends.filter({ searcFriendsItem in
                searcFriendsItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
