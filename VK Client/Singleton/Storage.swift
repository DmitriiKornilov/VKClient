//
//  Storage.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 12.01.2022.
//

import UIKit

class Storage: NSObject {
    //сделать в классе свойство которое будет хранится ссылка на этот же класс
    static let share = Storage()
   //чтобы никто не смог воспользоваться этим классом переопределяем инит
    private override init() {
        super.init()
    }

    //переменные и функции которые доступны во всей программе
    
    var allGroups = [Group]()

    var myGroups = [Group]()

    var friends = [Friend]()

    //проверка на дубли
//    func isContains(item: [Group]) -> Bool {
//        return Storage.share.myGroups.contains { myGroupsItem in
//            var myGroupsItem = Storage.share.allGroups[item]
//        }
//    }

    func isContains(item: Int) -> Bool {
        return Storage.share.myGroups.contains { myGroupsItem in
               myGroupsItem == Storage.share.allGroups[item]
           }
       }
}

