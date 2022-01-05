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
/// при корректной авторизации продим в аккаунт клиента
    @IBAction func pressToLogin(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTestField.text else {return}
        if login == "admin",
           password == "admin" {
            performSegue(withIdentifier: loginButtonSegue, sender: nil)
        } else {
            print("error")
        }
    }
}
