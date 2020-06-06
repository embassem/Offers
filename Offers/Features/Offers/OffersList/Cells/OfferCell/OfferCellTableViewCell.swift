//
//  OfferCellTableViewCell.swift
//  Offers
//
//  Created by Bassem Abbas on 6/6/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class OfferCellTableViewCell: UITableViewCell {
    private static let  name = "OfferCellTableViewCell"
    static let nib = UINib(nibName: OfferCellTableViewCell.name, bundle: .main)
    static let reuseIdentifier: String = OfferCellTableViewCell.name

    var item: Item?

    @IBOutlet private weak var itemFavoriteCountLabel: UILabel!
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemBrandLabel: UILabel!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemTagsLabel: UILabel!

    override var reuseIdentifier: String? {
        return OfferCellTableViewCell.reuseIdentifier
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }

    override func prepareForReuse() {
        reset()
        super.prepareForReuse()
    }

    private func reset() {
        clear()
        setupStyle()
    }
    private func clear() {
        itemFavoriteCountLabel.text = nil
        itemImageView.image = nil
        itemBrandLabel.text = nil
        itemTitleLabel.text = nil
        itemTagsLabel.text = nil
        itemFavoriteCountLabel.text = nil
        item = nil
    }
    private func setupStyle() {
        itemBrandLabel.setFont(style: .caption1Regular)
        itemFavoriteCountLabel.setFont(style: .caption1Regular)
        itemTitleLabel.setFont(style: .title2Bold)
        itemTagsLabel.setFont(style: .caption1Regular)
    }

    func bind(offerItem: Item) {
        self.item = offerItem
        itemImageView.setImageWith(urlString: offerItem.imageUrl)
        itemBrandLabel.text = offerItem.brand
        itemTitleLabel.text = offerItem.title
        itemTagsLabel.text = offerItem.tags
        itemFavoriteCountLabel.text = String(offerItem.favoriteCount ?? 0 )

    }
}
