//
//  PermissionViewModel.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation

class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    private var permissionViewDismissBlock: VoidBlock?
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func subscribeRequestPermissionDismissed(with completion: @escaping VoidBlock) {
        permissionViewDismissBlock = completion
    }
    
    func getPermissionRequestViewData() -> PermissionViewData {
        return manager.getPermissionRequestViewData(with: requestPermissonListener, with: notNowListener)
    }
    
    private func permissionListenerHandler() {
        print("permissionListenerHandler tapped")
        guard let dismissBlock = permissionViewDismissBlock else { return }
        manager.requestPermission(completion: dismissBlock)
    }

    lazy var requestPermissonListener: VoidBlock = { [weak self] in
        self?.permissionListenerHandler()
    }
    
    lazy var notNowListener: VoidBlock = { [weak self] in
        print("Dismissed")
        self?.permissionViewDismissBlock?()
    }
    
}
