//
//  EnumDicti.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 15.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI

enum  EnumDicti : String, CaseIterable, Identifiable {
    case dictiRus
    case dictiPerc
    case dictiFarsi
    case dictiEng
    case dictiTalysh
        
    case dictiRusEn
    case dictiPercEn
    case dictiFarsiEn
    case dictiEngEn
    case dictiTalyshEn
        
    var id : String {self.rawValue }
    
    
    var description: String {
       get {
         switch self {
           case .dictiRus:
             return "Русский"
           case .dictiPerc:
             return "Персидский"
           case .dictiFarsi:
             return "Азербайджанский"
         case .dictiEng:
           return "Английский"
         case .dictiTalysh:
           return "Талышский"
    
         case .dictiRusEn:
           return "Russian"
         case .dictiPercEn:
           return "Persian"
         case .dictiFarsiEn:
           return "Azerbaijani"
       case .dictiEngEn:
         return "English"
       case .dictiTalyshEn:
         return "Talysh"
         }
       }
     }
}
    
