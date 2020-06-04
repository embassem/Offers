//
//  UIImageView.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//
import UIKit

extension UIImageView {

    func flipImage() {
        let image = self.image
        let flipedImage = image?.imageFlippedForRightToLeftLayoutDirection()
        self.image = flipedImage
    }

    func setImageWith(urlString: String?, placeholder: UIImage? = nil ) {
        self.image = placeholder
        guard let imageurl = urlString ,
            let url = URL(string: imageurl)
            else { return }
        print(url)
        //self.kf.setImage(with: url, placeholder: imagePlaceholder )
    }
}
