//
//  Localized+Runtime.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

extension L10n {
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle.main, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
