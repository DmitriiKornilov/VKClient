//
//  GalleryController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import UIKit

class GalleryController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

let reuseIdentifireGalleryCell = "reuseIdentifireGalleryCell"
    var photoArray = [String]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryCell",
                                      bundle: nil),
                                forCellWithReuseIdentifier: reuseIdentifireGalleryCell)
    }
}
