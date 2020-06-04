//
//  AppTabBarController.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = false
        setupTheme()
        let tabs = getViewsForTabBar()
        self.setViewControllers(tabs, animated: false)
        if tabs.count < 2 {
            tabBar.isHidden = true
        }
    }

    func setupTheme() {

        if #available(iOS 13, *) {
            let appearance = self.tabBar.standardAppearance.copy()
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .clear
            tabBar.standardAppearance = appearance
        } else {
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
        tabBar.tintColor = UIColor.lightGray
        tabBar.barTintColor = UIColor.white
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.5

    }

    private func getViewsForTabBar() -> [UIViewController] {

        let basic = Container.Root.getOfferHomeScene()
        basic.tabBarItem = UITabBarItem(
            title: "Offers",
            image: nil,
            tag: 0)

        return  [basic]
    }
}

extension AppTabBarViewController: UITabBarControllerDelegate {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
    }
}

private extension UIImage {

    func resizeStreatchedImage(size: CGSize) -> UIImage {

        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage?.resizableImage(withCapInsets: .zero, resizingMode: .stretch) ?? UIImage()
    }
}
