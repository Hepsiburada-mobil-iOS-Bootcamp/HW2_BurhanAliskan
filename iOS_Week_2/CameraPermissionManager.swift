//
//  CameraPermissionManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation
import Combine
import AVFoundation

public typealias VoidBlock = () -> Void

class CameraPermissionManager: CameraPermissionProtocol {

    func checkPermission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return true
        default:
            return false
        }
    }
    
    func requestPermission(completion: @escaping VoidBlock) {
        print("\(#function) : CameraPermissionManager")
        AVCaptureDevice.requestAccess(for: .video) { granted in
            print("CAMERA PERMISSION GRANTED : \(granted)")
            completion()
        }
    }
    
    func getPermissionRequestViewData(with pozitifCompletion: @escaping VoidBlock, with negativeCompletion: @escaping VoidBlock) -> PermissionViewData {
        return PermissionViewData(image: PermissionImages.notif.value, infoViewData: InfoViewData(title: "Photos Permission", subTitle: "Would you please give us permission to reach out your galery."), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(text: "NOT NOW", buttonType: .filled(.bright)).setActionButtonListener(by: negativeCompletion), positiveButtonData: ActionButtonData(text: "OK", buttonType: .outlined(.bright)).setActionButtonListener(by: pozitifCompletion)))
    }

}
