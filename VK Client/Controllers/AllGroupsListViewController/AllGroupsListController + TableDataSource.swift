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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}
        
        cell.configure(image: nil, name: allGroups[indexPath.row], description: nil)
        return cell
    }
}
