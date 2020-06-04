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
        class func getRootTapScene() -> UIViewController {
            return AppTabBarViewController()
        }

        class func getOfferHomeScene() -> UIViewController {
            let channels = UIViewController()
            channels.edgesForExtendedLayout = .all
            channels.extendedLayoutIncludesOpaqueBars = true
            return channels.embadInNav()
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
