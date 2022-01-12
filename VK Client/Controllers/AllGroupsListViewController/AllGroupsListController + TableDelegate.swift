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

    //при нажатии на группу добавляет ее в мои группы, если нету дубля
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print(Storage.share.allGroups[indexPath.row])
        if !Storage.share.isContains(item: indexPath.row) {
            Storage.share.myGroups.append(Storage.share.allGroups[indexPath.row])
        }
    }
}
