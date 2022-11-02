//
//  Module.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

struct Module<Container: UIViewController, ModuleInput> {
    let container: Container
    let moduleInput: ModuleInput
}
