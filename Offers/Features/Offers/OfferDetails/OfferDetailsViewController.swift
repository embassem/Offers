//
//  OfferDetailsViewController.swift
//  Offers
//
//  Created Bassem Abbas on 6/5/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import UIKit

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

    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigation()
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
