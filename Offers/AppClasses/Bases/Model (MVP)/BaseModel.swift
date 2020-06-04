//
//  BaseModel.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//
import Foundation

class BaseModel: NSObject,
BaseModelProtocol {

}

enum ModelsError: String, Error, LocalizedError {
    case customError = "Something went wrong."
}
