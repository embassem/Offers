//
//  BaseView.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol BaseViewProtocol: class {

    func showLoading(allowNavigation: Bool)

    func hideLoading()

    func showError(message: String)
}

extension BaseViewProtocol where Self: BaseViewController {

    func showLoading(allowNavigation: Bool) {
        fatalError("\(#function) Not Implemented")
    }

    func hideLoading() {
        fatalError("\(#function) Not Implemented")
    }

    func showError(message: String) {
        fatalError("\(#function) Not Implemented")
    }
}
