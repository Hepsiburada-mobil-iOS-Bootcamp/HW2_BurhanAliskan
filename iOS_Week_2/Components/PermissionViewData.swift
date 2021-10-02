//
//  PermissionViewData.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import UIKit

class PermissionViewData {
    
    private(set) var image: UIImage
    private(set) var infoViewData: InfoViewData
    private(set) var actionModuleData: ActionModuleData
    
    init(image: UIImage, infoViewData: InfoViewData, actionModuleData: ActionModuleData) {
        self.image = image
        self.infoViewData = infoViewData
        self.actionModuleData = actionModuleData
    }
    
}

