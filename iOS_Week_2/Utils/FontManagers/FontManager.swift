//
//  FontManager.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import Foundation
import UIKit

enum FontManager: GenericValueProtocol {
    
    typealias Value = UIFont
    
    var value: UIFont {
        switch self {
        case .robotoBlack(let size):
            return UIFont(name: "Roboto-Black", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoBlackItalic(let size):
            return UIFont(name: "Roboto-BlackItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoBold(let size):
            return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoBoldItalic(let size):
            return UIFont(name: "Roboto-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoItalic(let size):
            return UIFont(name: "Roboto-Italic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoLight(let size):
            return UIFont(name: "Roboto-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoLightItalic(let size):
            return UIFont(name: "Roboto-LightItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoMedium(let size):
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoMediumItalic(let size):
            return UIFont(name: "Roboto-MediumItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoRegular(let size):
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .robotoThin(let size):
            return UIFont(name: "Roboto-Thin", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }

    case robotoBlack(CGFloat)
    case robotoBlackItalic(CGFloat)
    case robotoBold(CGFloat)
    case robotoBoldItalic(CGFloat)
    case robotoItalic(CGFloat)
    case robotoLight(CGFloat)
    case robotoLightItalic(CGFloat)
    case robotoMedium(CGFloat)
    case robotoMediumItalic(CGFloat)
    case robotoRegular(CGFloat)
    case robotoThin(CGFloat)
}
