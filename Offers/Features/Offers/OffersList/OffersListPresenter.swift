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

        view?.showLoading(allowNavigation: true)
        model?.getOffers(completion: { (result) in

            switch result {
            case .success(let newOffers):
                self.offers = newOffers
                //TODO : remove this DispatchQueue After as it for demo delay purpose only.
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayTime) {

                    self.view?.updateDisplayedOffers(offers: newOffers, refresh: true)

                }
            case .failure(let error):
                //NSURLErrorTimedOut = -1001
                //NSURLErrorNotConnectedToInternet = -1009

                if let errorCode = error.code, ( 1009...1009 ~= abs(errorCode)) {
                    self.view?.updateOffersWithNoInternet()
                } else {
                    self.view?.showError(message: error.localizedDescription)
                }
            }

            self.view?.hideLoading()
        })
    }
}
