//
//  AppNavigationController.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = false
        }
        self.navigationBar.tintColor = UIColor.black
        self.navigationItem.leftItemsSupplementBackButton = true
        //        self.navigationBar.tintColor = #colorLiteral(red: 0.2963504195, green: 0.3806865215, blue: 0.5296425819, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        if #available(iOS 13.0, *) {
            styleiOS13()
        }
    }

    @available(iOS 13.0, *)
    func styleiOS13() {
        let navBarAppearance = UINavigationBarAppearance()

        // Call this first otherwise it will override your customizations
        navBarAppearance.configureWithTransparentBackground()

        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black // Navigation bar title color
            //.font: AppFonts.font(forTextStyle: .largeTitle) // Navigation bar title font
        ]

        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black // Navigation bar title color
            // .font: AppFonts.font(forTextStyle: .largeTitle) // Navigation bar title font
        ]

        navBarAppearance.backgroundColor = UIColor.white // Navigation bar bg color
        navBarAppearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8) // Only works on non large title

        navigationBar.standardAppearance = navBarAppearance
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.prefersLargeTitles = false // Activate large title
    }
}
