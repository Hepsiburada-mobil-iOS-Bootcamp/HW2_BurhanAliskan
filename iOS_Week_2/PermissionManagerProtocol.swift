//
//  PermissionManagerProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import Foundation
import Combine

protocol PermissionManagerProtocol {
    
    func requestPermission(completion: @escaping VoidBlock)
    
    func getPermissionRequestViewData(with pozitifCompletion: @escaping VoidBlock, with negativeCompletion: @escaping VoidBlock) -> PermissionViewData
    
}
