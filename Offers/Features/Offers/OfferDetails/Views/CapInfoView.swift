//
//  CapInfoView.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class CapInfoView: UIView {
    @IBOutlet private weak var capInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHidden = true
        capInfoLabel.setFont(style: .caption2Medium)
    }

    func setTitle (title: String?) {
        guard let info = title, info.isEmpty == false else { return }

        capInfoLabel.text = info
        self.isHidden = false
    }
}
