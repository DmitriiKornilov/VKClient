//
//  FriendsListController + TableDataSource.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

extension FriendsListController: UITableViewDataSource {

    /// Метод для количества ячеек по количество друзей в массиве
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    ///наполнение ячейки
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configure(image: nil,
                       name: friends[indexPath.row],
                       description: nil)
        return cell
    }


}
