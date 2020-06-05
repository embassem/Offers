//
//  OffersListBuilder.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import  UIKit

class OffersListBuilder {

    class func createModule() -> UIViewController {

        let view = OffersListViewController(nibName: "OffersListViewController", bundle: nil)
        let model = OffersListModel()
        let presenter = OffersListPresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)

        return view

    }
}
