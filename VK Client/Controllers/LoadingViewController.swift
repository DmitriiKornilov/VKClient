//
//  LoadingViewController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 25.01.2022.
//

import UIKit

///MARK: -удалить, тестовое задание
class LoadingViewController: UIViewController {

    @IBOutlet weak var firstLoad: UIView!
    @IBOutlet weak var secondLoad: UIView!
    @IBOutlet weak var thirdLoad: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstLoad.layer.cornerRadius = 20
        secondLoad.layer.cornerRadius = 20
        thirdLoad.layer.cornerRadius = 20
    }

    ///метод анимации загрузки
    func animation(exitAfter: Int, current: Int = 0) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.firstLoad.alpha = 0
            self?.secondLoad.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.secondLoad.alpha = 0
                self?.thirdLoad.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.thirdLoad.alpha = 0
                    self?.firstLoad.alpha = 1
                } completion: { [weak self] _ in
                    if current < exitAfter {
                        self?.animation(exitAfter: exitAfter, current: current + 1)
                    } else {
                        self?.firstLoad.alpha = 0
                    }
                }
            }
        }
    }

    @IBAction func startAnimation(_ sender: Any) {
        animation(exitAfter: 5)
    }
}

