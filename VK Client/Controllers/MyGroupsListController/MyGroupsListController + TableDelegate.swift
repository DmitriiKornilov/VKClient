//
//  MyGroupsListController + TableDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

extension MyGroupsListController: UITableViewDelegate {

    ///Метод для указания стандартной высоты ячейки
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heighForCellTableView
    }

    ///Метод нажатия на ячейку
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print(myGroups[indexPath.row])
    }
}