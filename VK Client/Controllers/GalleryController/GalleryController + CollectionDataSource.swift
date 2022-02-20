//
//  GalleryController + CollectionDataSource.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import UIKit

extension GalleryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifireGalleryCell,
                                                            for: indexPath) as? GalleryCell else {return UICollectionViewCell()}
        cell.configure(photoPath: photoArray[indexPath.row])
        return cell
    }
}
