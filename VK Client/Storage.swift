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
    
    let allGroups = ["Football", "Cinema", "iOS Development", "Apple",
                     "Funny Videos", "DC Comics", "Marvel",
                     "World of Warcraft Guides", "Ozon Sales"]

    var myGroups = [String]()

    ///проверка на дубли
    func isContains(item: Int) -> Bool {
        return Storage.share.myGroups.contains { myGroupsItem in
            myGroupsItem == Storage.share.allGroups[item]
        }
    }







}


