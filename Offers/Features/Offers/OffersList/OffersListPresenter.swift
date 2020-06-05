//
//  OffersListPresenter.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

class OffersListPresenter<View: OffersListViewProtocol, Model: OffersListModelProtocol>:
BasePresenter<View, Model>, OffersListPresenterProtocol {
    
    private var view: View?
    private var model: Model?

    override init(view: View, model: Model) {
        super.init(view: view, model: model)
        self.view = view
        self.model = model
    }

}
