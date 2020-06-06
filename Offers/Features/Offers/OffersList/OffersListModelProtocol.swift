//
//  OffersListModelProtocol.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol OffersListModelProtocol: BaseModelProtocol {

    func getOffers( completion: @escaping (_ Status: Result<OffersList, Error>) -> Void)
}
