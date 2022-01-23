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
        guard  let view = xib.instantiate(withOwner: self, options: nil).first as? UIView else {return UIView()}
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
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeCounter -= 1
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        likeLabel.text = String(likeCounter)
        isLikeEmpty = !isLikeEmpty
    }
}
