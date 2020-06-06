//
//  OffersListViewController.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import UIKit

class OffersListViewController: BaseViewController {

    // MARK: - Presenter
    private var presenter: OffersListPresenterProtocol?
    func setPresenter(presenter: OffersListPresenterProtocol) {
        self.presenter = presenter
    }

    // MARK: - Public Variables

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = L10n.OffersList.title
        createNavigationBtn()
    }
}

// MARK: - IBActions
extension OffersListViewController {

}

// MARK: - Selectors
extension OffersListViewController {

}

// MARK: - Private
extension OffersListViewController {

    func createNavigationBtn() {
        let rightButton = UIBarButtonItem(title: "Details",
                                          style: .plain,
                                          target: self,
                                          action: #selector(navigateToDetails))
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc
    func navigateToDetails() {
        if let offerItem = Item.sampleItem() {
            let detailsVc = Container.Root.getOfferDetailsScene(offerItem: offerItem)
            self.push(viewController: detailsVc)
        }
    }
}

// MARK: - Protocal
extension OffersListViewController: OffersListViewProtocol {

}
