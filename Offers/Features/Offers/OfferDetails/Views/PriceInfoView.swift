//
//  PriceInfoView.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class PriceInfoView: UIView {

    @IBOutlet private weak var priceTitleLabel: UILabel!
    @IBOutlet private weak var offerOldPricceLabel: UILabel!
    @IBOutlet private weak var offerNewPriceLabel: UILabel!
    @IBOutlet private weak var offerExpirationDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHidden = true
        priceTitleLabel.setFont(style: .caption1Regular)
        offerOldPricceLabel.setFont(style: .caption3Regular)
        offerNewPriceLabel.setFont(style: .medium5)
        offerExpirationDateLabel.setFont(style: .caption1Regular)

    }
    func setTitles (oldPrice: String?, newPrice: String?, expirationDate: String? ) {
        offerOldPricceLabel.text = oldPrice

        let oldPriceattributeString: NSMutableAttributedString = NSMutableAttributedString(string: oldPrice ?? "")
        oldPriceattributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: oldPriceattributeString.length) )
        offerOldPricceLabel.attributedText = oldPriceattributeString
        offerNewPriceLabel.text = newPrice
        offerExpirationDateLabel.text = expirationDate

        self.isHidden = false
    }
}
