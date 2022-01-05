//
//  AllGroupsListController + TableDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 05.01.2022.
//

import UIKit

extension AllGroupsListController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heighForCellTableView
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print(allGroups[indexPath.row])
    }
}
