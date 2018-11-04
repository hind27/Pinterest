//
//  Endpoint.swift
//  Test Layout
//
//  Created by hind on 10/21/18.
//  Copyright © 2018 hind. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl :String{ get }
    var path :String{get}
    var urlParameters :[URLQueryItem] {get}
}
extension Endpoint {
    var urlComponent: URLComponents {
        var urlComponent = URLComponents(string: baseUrl)
        urlComponent?.path = path
        urlComponent?.queryItems = urlParameters
        
        return urlComponent!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}
enum  order :String {
     case popular ,latest ,oldest
}
enum UnspashEndpoint: Endpoint {
    case photos( id :String , order :order)
    var baseUrl: String{
        return "http://unsplash.com"
    }
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var urlParameters: [URLQueryItem] {
        switch self {
        case .photos(let id, let order):
            
            return [
                URLQueryItem(name: "client_id", value: id),
                URLQueryItem(name: "order_by", value: order.rawValue)
            ]
        }
        
    }
    
}
