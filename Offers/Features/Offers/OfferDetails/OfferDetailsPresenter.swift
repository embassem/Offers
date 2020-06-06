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

    private(set) var offer: OfferDetails!

    override init(view: View, model: Model) {
        super.init(view: view, model: model)
        self.view = view
        self.model = model
    }

    convenience init (offer: OfferDetails, view: View, model: Model) {
        self.init(view: view, model: model)
        self.offer = offer
    }

    func viewDidLoad() {
        view?.updateDisplayedOffer(offer: offer)
        self.getFullOfferDetails()
    }

    func toggleLikeOffer() {
        print(#function, "action for offer: \(String(describing: offer.id))")
    }

    func getFullOfferDetails() {
        guard let id = offer.id else { return }
        model?.getOffer(id: id, completion: { (result) in

            switch result {
            case .success(let newOffer):
                self.offer = newOffer
                //TODO : remove this DispatchQueue After as it for demo delay purpose only.
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayTime) {
                    self.view?.updateDisplayedOffer(offer: self.offer)
                }
            case .failure(let error):

                if let errorCode = error.code, ( 1009...1009 ~= abs(errorCode)) {
                    self.view?.updateOfferDetailWithNoInternet()
                } else {
                    self.view?.showError(message: error.localizedDescription)
                }
            }
        })
    }
}
