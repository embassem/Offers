//
//  OfferDetailsModel.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

class OfferDetailsModel: BaseModel, OfferDetailsModelProtocol {
    func getOffer(id: Int, completion: @escaping (_ Status: Result<OfferDetails, Error>) -> Void) {
        if let offer = loadSample() {
            return completion(.success(offer))
        }
    }
}

private extension OfferDetailsModel {
    func loadSample() -> OfferDetails? {

        if let path = Bundle.main.path(forResource: "details", ofType: "json" ) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let offer = try JSONDecoder().decode(OfferDetails.self, from: data)
                return offer
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
