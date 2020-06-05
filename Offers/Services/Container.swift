//
//  Container.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//
import UIKit

class Container {

    class func getSplashScene() -> UIViewController {
        return SplashViewController()
    }

    class Root {
        class func getRootScene() -> UIViewController {
            return getOffersListScene()
        }

        class func getOffersListScene() -> UIViewController {
            let offer = OffersListBuilder.createModule()
            offer.edgesForExtendedLayout = .all
            offer.extendedLayoutIncludesOpaqueBars = true
            return offer.embadInNav()
        }
        
        class func getOfferDetailsScene(offer: Any) -> UIViewController {
            let details = OfferDetailsBuilder.createModule(offer: offer)
            return details
        }
    }
}

fileprivate extension UIViewController {

    func embadInNav(hideBar: Bool = false) -> UINavigationController {
        let nav = AppNavigationController(rootViewController: self)
        nav.view.backgroundColor = UIColor.white
        nav.isNavigationBarHidden = hideBar
        return nav
    }

}
