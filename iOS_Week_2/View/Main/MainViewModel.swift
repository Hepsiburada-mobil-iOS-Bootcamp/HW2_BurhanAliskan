//
//  MainViewModel.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation

class MainViewModel {
    
    private let cameraPermissionManager = PermissionManagerFactory.getCameraPermissioManager()
    private let photoPermissionManager = PermissionManagerFactory.getPhotoPermissionManager()
    
    func openCamera(with completion: BooleanBlock) {
        completion(cameraPermissionManager.checkPermission())
    }
    
    func openPhotos(with completion: BooleanBlock) {
        completion(photoPermissionManager.checkPhotosPermission())
    }
    
    func getCameraActionButtonData() -> ActionButtonData {
        return ActionButtonData(text: "Camera", buttonType: .filled(.smooth))
    }
    
    func getPhotosOpenActionButton() -> ActionButtonData {
        return ActionButtonData(text: "Photo", buttonType: .filled(.bright))
    }
    
}
