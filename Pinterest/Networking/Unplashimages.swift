//
//  Unplashimages.swift
//  Test Layout
//
//  Created by hind on 10/21/18.
//  Copyright © 2018 hind. All rights reserved.
//

import Foundation
typealias Photos = [Photo]
struct Photo : Codable {
     let id: String
     let urls: URLS
}

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
