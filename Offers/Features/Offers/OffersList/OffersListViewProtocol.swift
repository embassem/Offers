//
//  OffersListViewProtocol.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//
import Foundation

protocol OffersListViewProtocol: BaseViewProtocol {
    func updateDisplayedOffers(offers: OffersList, refresh: Bool)
    func updateOffersWithError()
    func updateOffersWithNoInternet()
}
