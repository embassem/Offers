//
//  OfferDetailsViewController.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
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

class OfferDetailsViewController: BaseViewController {

    // MARK: - Presenter
    private var presenter: OfferDetailsPresenterProtocol?
    func setPresenter(presenter: OfferDetailsPresenterProtocol) {
        self.presenter = presenter
    }

    // MARK: - Public Variables

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var headerImageContainer: UIView!
    @IBOutlet private weak var offerMainImageView: UIImageView!
    @IBOutlet private weak var offerBrandLabel: UILabel!
    @IBOutlet private weak var offerLikeslabel: UILabel!
    @IBOutlet private weak var offerTitleLabel: UILabel!

    @IBOutlet private weak var detailsContainerView: OfferDetailsView!
    @IBOutlet private weak var priceInfoContainerView: PriceInfoView!
    @IBOutlet private weak var capInfoContainerView: CapInfoView!

    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigation()
        styleViews()
        presenter?.viewDidLoad()
    }
}

// MARK: - IBActions
extension OfferDetailsViewController {

}

// MARK: - Selectors
extension OfferDetailsViewController {

}

// MARK: - Private
extension OfferDetailsViewController {

    fileprivate func styleViews() {
        if #available(iOS 11.0, *) {
            stackView.setCustomSpacing(32.0, after: headerImageContainer)
        } else {
            // Fallback on earlier versions
        }
        offerTitleLabel.setFont(style: .title1Medium)
        offerBrandLabel.setFont(style: .caption2Mediam)
        offerLikeslabel.setFont(style: .caption2Mediam)
    }

    fileprivate func styleNavigation() {
        navigationItem.removeBackBarButtonTitle()
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = addCustomBackButton()
        navigationItem.rightBarButtonItems = rightBarButton()
    }

    func rightBarButton() -> [UIBarButtonItem] {

        let likeBtn = UIButton(type: .custom)
        likeBtn.frame = CGRect(x: 0.0, y: 0.0, width: 44, height: 44)
        likeBtn.setImage(Asset.Images.icLike.image, for: [])
        likeBtn.addTarget(self, action: #selector(didTapLikeButton), for: UIControl.Event.touchUpInside)

        let shareBtn = UIButton(type: .custom)
        shareBtn.frame = CGRect(x: 0.0, y: 0.0, width: 44, height: 44)
        shareBtn.setImage(Asset.Images.icShare.image, for: [])
        shareBtn.addTarget(self, action: #selector(didTapShareButton), for: UIControl.Event.touchUpInside)

        let likeBtnBarItem = UIBarButtonItem(customView: likeBtn)
        let shareBtnBarItem = UIBarButtonItem(customView: shareBtn)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        return [likeBtnBarItem, shareBtnBarItem, spacer]
    }

    @objc
    func didTapLikeButton() {

    }

    @objc
    func didTapShareButton() {
        //swiftlint:disable:next force_unwrapping
        let items = [URL(string: "https://thelucky.app/en/")!]
        let shareVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(shareVC, animated: true)

    }
}

// MARK: - Protocal
extension OfferDetailsViewController: OfferDetailsViewProtocol {

    func updateDisplayedOffer(offer: OfferDetails) {
        offerTitleLabel.text = offer.title ?? ""
        offerBrandLabel.text = offer.brand
        offerLikeslabel.text = String(offer.favoriteCount ?? 0 )
        offerMainImageView.setImageWith(urlString: offer.imageUrl)

        if let offerDetailsText = offer.descriptionField {
            detailsContainerView.setTitle(title: offerDetailsText)
        }
        if let price = offer.price {
            priceInfoContainerView
                .setTitles(oldPrice: price.old,
                           newPrice: price.newField,
                           expirationDate: offer.expiration)
        }
        if let cap = offer.redemptionsCap {
            capInfoContainerView
                .setTitle(title: String(format: "%@ %@",
                                        L10n.OfferDetails.redemptionsCaps,
                                        cap) )
        }
    }
}
