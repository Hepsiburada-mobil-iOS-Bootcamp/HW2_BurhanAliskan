//
//  GenericValueProtocol.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import Foundation
protocol GenericValueProtocol {
    associatedtype Value
    var value: Value {get}
}
