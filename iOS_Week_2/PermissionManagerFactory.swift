//
//  PermissionManagerFactory.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation

class PermissionManagerFactory {

    private static let cameraManager = CameraPermissionManager()
    private static let photoManager = PhotosPermissionManager()
    
    class func getManager(with type: PermissionType) -> PermissionManagerProtocol {
        
        switch type {
        case .photo:
            return photoManager
        case .camera:
            return cameraManager
        }
        
    }
    
    class func getCameraPermissioManager() -> CameraPermissionProtocol {
        return cameraManager
    }
    
    class func getPhotoPermissionManager() -> PhotosPermisionProtocol {
        return photoManager
    }
    
}
