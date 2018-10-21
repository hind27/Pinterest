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
    static let apiKey = "da097c2e80660d684a125567880617a6418021c604cc84264ecfaa151169e91b"
    
    func fetch(with endpoint: UnspashEndpoint, completion: @escaping (Eiher<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
