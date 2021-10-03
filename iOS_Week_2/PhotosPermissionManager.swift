//
//  PhotosPermissionManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation
import PhotosUI
import Combine
import SwiftUI

typealias BooleanBlock = (Bool) -> Void

class PhotosPermissionManager: NSObject, PhotosPermisionProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let photosStatusSubject = PassthroughSubject<Bool, Never>()
    
    private let pickerController = UIImagePickerController()
    private var selectedImage: ((Image) -> Void)?
    
    override init() {
        super.init()
        pickerController.delegate = self
    }
    
    func subscribePhotosStatusObject(completion: @escaping BooleanBlock) -> AnyCancellable {
        return photosStatusSubject.sink(receiveValue: completion)
    }
    
    func requestPermission(completion: @escaping VoidBlock) {
        print("\(#function) : PhotosPermissionManager")
        
        PHPhotoLibrary.requestAuthorization { status in
            print("photo access status : \(status)")
            self.handleRequestAuthorization(with: status)
            completion()
        }
    }
    
    func checkPhotosPermission() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        return (status == .authorized || status == .limited)
    }
    
    func selectPhoto(completion: @escaping (Image) -> Void) {
        selectedImage = completion
        guard let topMostViewController = UIApplication.topViewController() else { return }
        topMostViewController.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        selectedImage?(Image(uiImage: tempImage))
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    func getPermissionRequestViewData(with pozitiveCompletion: @escaping VoidBlock, with negativeCompletion: @escaping VoidBlock) -> PermissionViewData {
        return PermissionViewData(image: PermissionImages.notif.value, infoViewData: InfoViewData(title: "Photos Permission", subTitle: "Would you please give us permission to reach out your galery."), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(text: "NOT NOW", buttonType: .outlined(.bright)).setActionButtonListener(by: negativeCompletion), positiveButtonData: ActionButtonData(text: "OK", buttonType: .filled(.bright)).setActionButtonListener(by: pozitiveCompletion)))

    }
    
    // MARK: - Private Methods -
    private func handleRequestAuthorization(with value: PHAuthorizationStatus) {
        photosStatusSubject.send((value == .authorized || value == .limited))
    }
    
    
}
