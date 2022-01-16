//
//  FriendsListController + TableDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

extension FriendsListController: UITableViewDelegate {

    ///Метод для указания стандартной высоты ячейки
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heighForCellTableView
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromMyFriendsToGallery,
            let destenationController = segue.destination as? GalleryController,
            let friend = sender as? Friend {
                destenationController.photoArray = friend.Photos
        }
    }

    ///Метод нажатия на ячейку
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print(friends[indexPath.row])
        performSegue(withIdentifier: fromMyFriendsToGallery, sender: friends[indexPath.row])
    }
}
