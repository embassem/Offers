//
//  OffersListDataSource.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

protocol OffersListDataSourceDelegate: class {
    func didSelect(offer: Item)
}

class  OffersListDataSource: NSObject {
    var sections: [Section]?
    weak var delegate: OffersListDataSourceDelegate!
    private var tableview: UITableView

    func reload() {
        tableview.reloadData()
    }
    func appenOffers(_ sections: [Section], refresh: Bool) {
        if self.sections == nil || refresh == true {
            self.sections = []
        }
        self.sections?.append(contentsOf: sections)
        reload()
    }
    init(tableview: UITableView, delegate: OffersListDataSourceDelegate) {
        self.tableview = tableview
        self.delegate = delegate

        tableview.tableFooterView = UIView(frame: .zero)
        tableview.estimatedRowHeight = 104
        tableview.rowHeight = UITableView.automaticDimension
        tableview.sectionHeaderHeight = 60
    }
}

extension OffersListDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let sectionsCount = sections?.count ?? 0
        return sectionsCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellsInsection = sections?[section].items?.count ?? 0
        return cellsInsection
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: OffersSectionHeader.reuseIdentifier) as? OffersSectionHeader
        let sectionTitle = sections?[section].title ?? ""
        header?.setSectionTitle(title: sectionTitle)
        return header

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: OfferCellTableViewCell.reuseIdentifier,
            for: indexPath) as? OfferCellTableViewCell,
            let item = sections?[indexPath.section].items?[indexPath.row]
            else { return UITableViewCell() }
        cell.bind(offerItem: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension OffersListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? OfferCellTableViewCell ,
            let item = cell.item  else { return }
        self.delegate.didSelect(offer: item)
    }
}
