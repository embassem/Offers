//
//  OffersSectionHeader.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

final class OffersSectionHeader: UITableViewHeaderFooterView {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static let reuseIdentifier: String = String(describing: self)

    @IBOutlet private weak var sectionTitleLabel: UILabel!

    override  func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.background
        sectionTitleLabel.setFont(style: .headline1Mediam)
    }

    func setSectionTitle(title: String) {
        self.sectionTitleLabel.text = title
    }
}
