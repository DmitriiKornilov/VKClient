//
//  MyGroupsListController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 04.01.2022.
//

import UIKit

class MyGroupsListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let reuseIdentifierUniversalTableViewCell =
    "reuseIdentifierUniversalTableViewCell"
    
    var myGroups = [String]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UniversalTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier:
                            reuseIdentifierUniversalTableViewCell)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addGroupFromAllGroups(_:)),
                                               name: selectedGroupInAllGroupsPressedNotification,
                                               object: nil)
    }

    ///Проверка на дубли
    func isContains(item: String) -> Bool {
        myGroups.contains { myGroupsItem in
            myGroupsItem == item
        }
    }

    /// Если группа не повторяется, то добавдяем ее в Мои группы
    @objc func addGroupFromAllGroups(_ notification: Notification) {
        guard let newGroup = notification.object as? String else {return}
        if isContains(item: newGroup) {
            print("Уже добавили \(newGroup)")
        }
        else {
            myGroups.append(newGroup)
            print("Добавили группу \(newGroup)")
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
