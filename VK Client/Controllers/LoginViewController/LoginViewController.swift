//
//  LoginViewController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 28.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    let loginButtonSegue = "autorizationButtonPressed"

    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsData()
        fillDataAllGroups()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(onTap))

        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
    }

    @objc func keyboardDidShow(_ notification: Notification) {
        guard let keyboardHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)? .cgRectValue)?.height else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }

    @objc func onTap() {
        self.view.endEditing(true)
    }

    @objc func keyboardDidHide() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    /// при корректной авторизации проходим в аккаунт клиента, при неверных всплывает алерт
    @IBAction func pressToLogin(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTestField.text else {return}
        if login == "admin",
           password == "admin" {
            performSegue(withIdentifier: loginButtonSegue, sender: nil)
        } else {
            alert(title: "Error", msg: "Incorect data entry", style: .alert)
        }
    }

    ///Метод для некоректного ввода данных
    func alert(title: String, msg: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title,
                                                message: msg,
                                                preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    //метод для заполнения friends из структуры Friend

    func fillFriendsData() {
        let friendOne = Friend(name: "SubZero",
                               avatar: "SubZeroOne",
                               Photos: ["SubZeroOne",
                                        "SubZeroTwo",
                                        "SubZeroThree"])
        let friendTwo = Friend(name: "Scorpion",
                               avatar: "ScorpionOne",
                               Photos: ["ScorpionOne",
                                        "ScorpionTwo",
                                        "ScorpionThree"])
        let friendThree = Friend(name: "Cyrex",
                                 avatar: "CyrexOne",
                                 Photos: ["CyrexOne",
                                          "CyrexTwo",
                                          "CyrexThree"])
        let friendFour = Friend(name: "Goro",
                                avatar: "GoroOne",
                                Photos: ["GoroOne",
                                         "GoroTwo",
                                         "GoroThree"])
        let friendFive = Friend(name: "Jax",
                                avatar: "JaxOne",
                                Photos: ["JaxOne",
                                         "JaxTwo",
                                         "JaxThree"])
        let friendSix = Friend(name: "Kano",
                               avatar: "KanoOne",
                               Photos: ["KanoOne",
                                        "KanoTwo",
                                        "KanoThree"])

        Storage.share.friends.append(friendOne)
        Storage.share.friends.append(friendTwo)
        Storage.share.friends.append(friendThree)
        Storage.share.friends.append(friendFour)
        Storage.share.friends.append(friendFive)
        Storage.share.friends.append(friendSix)
    }

    func fillDataAllGroups() {
        let groupOne = Group(name: "Cinema",
                             avatar: "cinema",
                             discription: "Все о кино")
        let groupTwo = Group(name: "Football",
                             avatar: "football",
                             discription: "Новости о футболе")
        let groupThree = Group(name: "iOsDev",
                               avatar: "iOsDev",
                               discription: "iOsDev")

        Storage.share.allGroups.append(groupOne)
        Storage.share.allGroups.append(groupTwo)
        Storage.share.allGroups.append(groupThree)
    }
}


