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
    @IBOutlet weak var roundForImageView: UIView!
    var completion: (() -> Void)?

    ///чистим перед использованием
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLabel.text = nil
descriptionLabel.text = nil
        self.completion = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.layer.cornerRadius = 25
        roundForImageView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        roundForImageView.layer.shadowOpacity = 0.7
        roundForImageView.layer.shadowRadius = 5

    }

    ///конфигурация наполнения ячейки

    func configureGroup(allGroups: Group) {
        mainImageView.image = UIImage(named: allGroups.avatar)
        nameLabel.text = allGroups.name
        descriptionLabel.text = allGroups.discription
    }

    func configureFriend(friend: Friend, completion: @escaping () -> Void) {
        self.completion = completion
        mainImageView.image = UIImage(named: friend.avatar)
        nameLabel.text = friend.name
        descriptionLabel.text = nil
    }

    @IBAction func pressForAnimationOfAvatar(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.mainImageView.frame = CGRect.zero

        } completion: { [weak self] _ in
            self?.completion?()
        }
    }
}

