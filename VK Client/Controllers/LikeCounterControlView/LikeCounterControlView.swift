//
//  LikeCounterControlView.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 23.01.2022.
//

import UIKit

@IBDesignable class LikeCounterControlView: UIView {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    var likeCounter = 0
    var isLikeEmpty = true
    private var view:UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func loadFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeCounterControlView", bundle: bundle)
        guard  let view = xib.instantiate(withOwner: self, options: nil).first
                as? UIView else {return UIView()}
        return view
    }

    func setup() {
        self.view = loadFromXib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }

    @IBAction func pressLikeButton(_ sender: Any) {
        if isLikeEmpty {
            likeCounter += 1
            //анимация количества лайков
            UIView.transition(with: likeLabel,
                              duration: 1,
                              options: [.transitionFlipFromLeft]) {
                [weak self] in
                guard let self = self else {return}
                self.likeLabel.text = String(self.likeCounter)
            } completion: { _ in

            }
            //анимация сердечка
            UIView.transition(with: likeButton,
                              duration: 1,
                              options: [.transitionCurlUp]) { [weak self] in
                guard let self = self else {return}
                self.likeButton.setImage(UIImage(systemName: "heart.fill"),
                                         for: .normal)
            } completion: { _ in

            }
        } else {
            likeCounter -= 1

            UIView.transition(with: likeLabel,
                              duration: 1,
                              options: [.transitionFlipFromRight]) {
                [weak self] in
                guard let self = self else {return}
                self.likeLabel.text = String(self.likeCounter)
            } completion: { _ in
            }
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            UIView.transition(with: likeButton,
                              duration: 1,
                              options: [.transitionCurlDown]) { [weak self] in
                guard let self = self else {return}
                self.likeButton.setImage(UIImage(systemName: "heart"),
                                         for: .normal)
            } completion: { _ in
            }
        }
        isLikeEmpty = !isLikeEmpty
    }
}
