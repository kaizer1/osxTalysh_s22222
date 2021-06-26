//
//  Language.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 20.06.2021.
//

import Foundation

enum Language: String {

    case russian = "ru"
    case english_us = "en"
    case aizer = "az"
    case farci = "fa"
    
    var userSymbol: String {
        switch self {
        case .english_us:
            return "us"
        case .russian:
            return "ru"
        case .aizer:
            return "az"
        case .farci:
            return "fa"
            
//        default:
//            return rawValue
        }
    }
}
