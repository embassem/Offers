//
//  NetworkDefaults.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct NetworkDefaults {

    var baseUrl: String = "https://www.nasable.com" // live

    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
