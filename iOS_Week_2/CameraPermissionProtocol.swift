//
//  CameraPermissionProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation

protocol CameraPermissionProtocol: PermissionManagerProtocol {
    
    func checkPermission() -> Bool

}
