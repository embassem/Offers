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

    lazy var datasource: OffersListDataSource = OffersListDataSource(
        tableview: offersTableView,
        delegate: self)
    // MARK: - Computed Variables

    // MARK: - IBOutlets
    @IBOutlet private weak var offersTableView: UITableView!

    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = L10n.OffersList.title
        prepareTableView()
        presenter?.viewDidLoad()
        setupLoadingShemmar()
    }

    func setupLoadingShemmar() {
        //TODO: implement a shemmer dataSource and pass Tableview for it
        // to hander animating in the Begining
    }

    func prepareTableView() {
        offersTableView.register(
            OfferCellTableViewCell.nib,
            forCellReuseIdentifier: OfferCellTableViewCell.reuseIdentifier)
        offersTableView.register(
            OffersSectionHeader.nib,
            forHeaderFooterViewReuseIdentifier: OffersSectionHeader.reuseIdentifier)
        setUpDataDatasource()

    }

    func setUpDataDatasource() {
        offersTableView.dataSource = datasource
        offersTableView.delegate = datasource
    }

    func didTapRefreshData() {
        presenter?.viewDidLoad()
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
    func navigateToDetails(offer: Item) {
        let detailsVc = Container.Root.getOfferDetailsScene(offerItem: offer)
        self.push(viewController: detailsVc)
    }
}

// MARK: - Protocal
extension OffersListViewController: OffersListViewProtocol {
    func updateDisplayedOffers(offers: OffersList, refresh: Bool) {
        self.offersTableView.backgroundView = nil
        datasource.appenOffers(offers.sections ?? [], refresh: true)
    }
    func updateOffersWithNoInternet() {
        let noInternetView = NoInternetView()
        noInternetView.refresh = self.didTapRefreshData
        self.offersTableView.backgroundView = noInternetView
    }

    func updateOffersWithError() {

    }
}
extension OffersListViewController: OffersListDataSourceDelegate {
    func didSelect(offer: Item) {
        navigateToDetails(offer: offer)
    }
}
