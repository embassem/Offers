//
//  OfferDetailsView.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class OfferDetailsView: UIView {
    @IBOutlet private weak var offerDetailsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHidden = true
        offerDetailsLabel.setFont(style: .body1light)
    }

    func setTitle (title: String?) {
        guard let info = title, info.isEmpty == false else { return }

        offerDetailsLabel.text = info
        offerDetailsLabel.setText(text: info, style: .body1light, lineHeight: 24)
        self.isHidden = false
    }
}
