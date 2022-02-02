//
//  AllGroupsListController + TableDataSource.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 05.01.2022.
//

import UIKit

extension AllGroupsListController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath)
                as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configureGroup(allGroups: allGroups[indexPath.row])
        //
        cell.pressedButtonOnCell.tag = indexPath.row
        cell.pressedButtonOnCell.addTarget(self, action: #selector(didTapCellButton(sender:)), for: .touchUpInside)
        return cell
    }
    //метод добавления ячейки в мои группы, попробовать релизовать в делегате
    @objc func didTapCellButton(sender:UIButton) {
        let button = sender
        guard let cell = button.superview?.superview as? UITableViewCell else {return}
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        if !Storage.share.isContains(item: indexPath.row) {
            Storage.share.myGroups.append(Storage.share.allGroups[indexPath.row])
        } else {
            print("уже существует")
        }
    }
}
