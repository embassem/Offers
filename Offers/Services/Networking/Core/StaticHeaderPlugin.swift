//
//  StaticHeaderPlugin.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//
import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {

    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
