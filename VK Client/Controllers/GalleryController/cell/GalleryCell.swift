//
//  GalleryCell.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!

    override func prepareForReuse() {
        photoImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(photoPath: String) {
        photoImageView.image = UIImage(named: photoPath)
    }
}
