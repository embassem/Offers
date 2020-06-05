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
        offerDetailsLabel.setFont(style: .caption2Normal)
    }
    
    func setTitle (title: String?) {
        guard let info = title, info.isEmpty == false else { return }
        
        offerDetailsLabel.text = info
        self.isHidden = false
    }
}

class CapInfoView: UIView {
    @IBOutlet private weak var capInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHidden = true
        capInfoLabel.setFont(style: .caption2Normal)
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
        priceTitleLabel.setFont(style: .caption1Normal)
        offerOldPricceLabel.setFont(style: .caption3Normal)
        offerNewPriceLabel.setFont(style: .caption4Normal)
        offerExpirationDateLabel.setFont(style: .caption1Normal)
        
    }
    func setTitles (oldPrice: String?, newPrice: String?, expirationDate: String? ) {
        offerOldPricceLabel.text = oldPrice
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
    @IBOutlet private weak var offerMainImageView: UIImageView!
    @IBOutlet private weak var offerTypeLabel: UILabel!
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
        offerTitleLabel.setFont(style: .title1Medium)
        offerTypeLabel.setFont(style: .caption2Mediam)
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
    
}
