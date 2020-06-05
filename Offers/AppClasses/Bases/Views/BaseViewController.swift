//
//  BaseViewController.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController,
BaseViewProtocol {

    func addCustomBackButton() -> UIBarButtonItem {
        let backBtn = UIBarButtonItem(
            image: Asset.Images.icBackArrow.image,
            style: .plain,
            target: self,
            action: #selector(didTapBackButton))
        return backBtn
    }
    
    @objc
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
