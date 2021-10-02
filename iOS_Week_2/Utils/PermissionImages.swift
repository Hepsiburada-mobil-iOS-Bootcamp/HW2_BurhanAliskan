//
//  PermissionImage.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import UIKit

enum PermissionImages: String, GenericValueProtocol {
    
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case notif = "notif_"
    case camera = "camera_"
}

