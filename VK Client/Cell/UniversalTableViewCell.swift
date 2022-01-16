//
//  UniversalTableViewCell.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    ///прокидываем аутлеты
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    ///чистим перед использованием
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    ///конфигурация наполнения ячейки
    func configure(image: UIImage?,
                   name: String?,
                   description: String?) {
        mainImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
    }

    func configure(friend: Friend) {
        mainImageView.image = UIImage(named: friend.avatar)
        nameLabel.text = friend.name
        descriptionLabel.text = String()

    }
}
