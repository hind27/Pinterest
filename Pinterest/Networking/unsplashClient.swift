//
//  unsplashClient.swift
//  Test Layout
//
//  Created by hind on 10/21/18.
//  Copyright © 2018 hind. All rights reserved.
//


import Foundation

class UnsplashClient: APIClient {
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = "28ebe57ce07e1472c4d3c6953f39ef2f60652d9fafca3aea260037ccdf297f52"
    
    func fetch(with endpoint: UnspashEndpoint, completion: @escaping (Eiher<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}

