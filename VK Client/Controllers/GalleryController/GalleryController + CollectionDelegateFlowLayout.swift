//
//  GalleryController + CollectionDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import Foundation
import UIKit


extension GalleryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.bounds.width / 3 - 20
        return CGSize(width: width, height: width)
    }

}
