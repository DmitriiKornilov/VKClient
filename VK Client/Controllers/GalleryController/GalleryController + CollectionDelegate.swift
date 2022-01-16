//
//  GalleryController + CollectionDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import Foundation
import UIKit


extension GalleryController: UICollectionViewDelegate {

    ///при нажатии на фоточку в галерее она отображается
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoViewController = PhotoViewController()
        photoViewController.photo = photoArray[indexPath.item]
        self.navigationController?.pushViewController(photoViewController,
                                                      animated: true)
    }

}
