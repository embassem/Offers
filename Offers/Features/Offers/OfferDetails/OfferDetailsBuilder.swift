//
//  OfferDetailsBuilder.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import  UIKit

class OfferDetailsBuilder {

    class func createModule(offer: Any) -> UIViewController {

        let view = OfferDetailsViewController(nibName: "OfferDetailsViewController", bundle: nil)
        let model = OfferDetailsModel()
        let presenter = OfferDetailsPresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)

        return view

    }
}
