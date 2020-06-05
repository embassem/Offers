//
//  OfferDetailsPresenter.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

class OfferDetailsPresenter<View: OfferDetailsViewProtocol, Model: OfferDetailsModelProtocol>:
BasePresenter<View, Model>, OfferDetailsPresenterProtocol {
    
    private var view: View?
    private var model: Model?

    override init(view: View, model: Model) {
        super.init(view: view, model: model)
        self.view = view
        self.model = model
    }

}
