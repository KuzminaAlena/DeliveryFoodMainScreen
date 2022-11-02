//
//  UIFont.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

extension UIFont {
    
    static let displaySemiboldTitle: UIFont = {
        guard let font = UIFont(name: "SFUIDisplay-Semibold", size: 17) else {
            assertionFailure("Couldn’t create custom font with name uniqueLargeTitle")
            return UIFont.systemFont(ofSize: 17, weight: .regular)
        }
        return font
    }()
    
    static let displayMediumTitle: UIFont = {
        guard let font = UIFont(name: "SFUIDisplay-Medium", size: 17) else {
            assertionFailure("Couldn’t create custom font with name uniqueLargeTitle")
            return UIFont.systemFont(ofSize: 17, weight: .regular)
        }
        return font
    }()
    
    static let displayRegularSubtitle: UIFont = {
        guard let font = UIFont(name: "SFUIDisplay-Regular", size: 13) else {
            assertionFailure("Couldn’t create custom font with name uniqueLargeTitle")
            return UIFont.systemFont(ofSize: 13, weight: .regular)
        }
        return font
    }()
    
    static let displayBoldSubtitle: UIFont = {
        guard let font = UIFont(name: "SFUIDisplay-Bold", size: 13) else {
            assertionFailure("Couldn’t create custom font with name uniqueLargeTitle")
            return UIFont.systemFont(ofSize: 13, weight: .regular)
        }
        return font
    }()
}

