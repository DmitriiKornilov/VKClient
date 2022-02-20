//
//  GalleryController + CollectionDelegate.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import UIKit

extension GalleryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let heightForLikeCounter:CGFloat = 50
        let countOfPhotosInRow:CGFloat = 3
        let distanceBetweenPhotos:CGFloat = 10
        let width = collectionView.bounds.width / countOfPhotosInRow - distanceBetweenPhotos
        return CGSize(width: width, height: width + heightForLikeCounter)
    }
}
