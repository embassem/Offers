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

    private(set) var offers: OffersList!

    override init(view: View, model: Model) {
        super.init(view: view, model: model)
        self.view = view
        self.model = model
    }

    func viewDidLoad() {
        self.getOffersList()
    }

    func getOffersList() {

        model?.getOffers(completion: { (result) in

            switch result {
            case .success(let newOffers):
                self.offers = newOffers
                //TODO : remove this DispatchQueue After as it for demo delay purpose only.
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayTime) {
                    self.view?.updateDisplayedOffers(offers: newOffers, refresh: true)
                }
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
            }
        })
    }
}
