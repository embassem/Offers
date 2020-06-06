//
//  OfferDetailsModelProtocol.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol OfferDetailsModelProtocol: BaseModelProtocol {
    func getOffer(id: Int, completion: @escaping (_ Status: Result<OfferDetails, Error>) -> Void)
}
