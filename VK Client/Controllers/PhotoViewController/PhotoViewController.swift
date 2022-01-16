//
//  PhotoViewController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 16.01.2022.
//

import UIKit


///где и что показывать
class PhotoViewController: UIViewController {

    var photo = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView =
        UIImageView(frame:
                        CGRect(x: 0,
                               y: self.view.bounds.height / 2 - self.view.bounds.width / 2,
                               width: self.view.bounds.width,
                               height: self.view.bounds.width))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: photo)

    }
}
