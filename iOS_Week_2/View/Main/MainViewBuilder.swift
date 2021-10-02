//
//  MainViewBuilder.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation
import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        return viewController
    }

}

