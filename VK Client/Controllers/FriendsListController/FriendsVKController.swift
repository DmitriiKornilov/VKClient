//
//  File.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 17.02.2022.
//

import Foundation
import WebKit

class FriendsVKController {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
}

extension FriendsVKController {

    func loadFriends() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "order", value: "random"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "fields", value: "contacts"),
            URLQueryItem(name: "fields", value: "photo_50")
        ]

        guard let url = urlComponents.url else { return }
            let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            if  let error = error {
                print("error")
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        }
        task.resume()
    }
}


// "https://api.vk.com/method/friends.get?access_token=916a05a957f43595e6d3a3bb1f7036721d32972312c097ef62384ab95e6ef78bcd7d01dfe391c1fa10a11&order=random&v=5.131&fields=contacts&fields=photo_50"
