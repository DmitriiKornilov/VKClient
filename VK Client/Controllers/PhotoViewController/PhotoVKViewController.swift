//
//  PhotoVKViewController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 20.02.2022.
//

import Foundation
import WebKit


class PhotoVKViewController {

    private let session:URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
}

extension PhotoVKViewController {

    func loadPhotos() {
        var urlComponents = URLComponents()
        urlComponents.host = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.getAll"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "rev", value: "0")
        ]
        guard let url = urlComponents.url else {return}
        let request = URLRequest(url: url)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let error = error {
                print("error")
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        }
        task.resume()
    }
}








