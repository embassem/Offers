//
//  OffersListModel.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

class OffersListModel: BaseModel, OffersListModelProtocol {

    func getOffers( completion: @escaping (_ Status: Result<OffersList, Error>) -> Void) {
        if let offer = loadSample() {
            return completion(.success(offer))
        }
    }
}

private extension OffersListModel {
    func loadSample() -> OffersList? {

        if let path = Bundle.main.path(forResource: "offerList", ofType: "json" ) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let offer = try JSONDecoder().decode(OffersList.self, from: data)
                return offer
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
