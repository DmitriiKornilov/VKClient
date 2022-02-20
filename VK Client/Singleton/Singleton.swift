//
//  Singleton.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 14.02.2022.
//

import Foundation

class Session {
    static let instance = Session()
    private init() {}
    //для хранения токена в VK
    var token: String?
    //для хранения идентификатора пользователя ВК
    var userId: Int?
}
