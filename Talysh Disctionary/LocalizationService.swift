//
//  LocalizationService.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 20.06.2021.
//

import Foundation


class LocalizationService {

    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    
    // was .english_us
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .russian
            }
            return Language(rawValue: languageString) ?? .english_us
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
    
    func backLang() -> Languages {
        
        if language == .russian {
            return .rus
        } else if language == .english_us {
            return .Eng }
        else if language == .aizer {
            return .azer}
        else {
            return .farci
        }
        }
        
    //}
}
