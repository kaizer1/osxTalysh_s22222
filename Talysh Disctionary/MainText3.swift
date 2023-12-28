//
//  MainText3.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 27.06.2021.
//

import SwiftUI

struct MainText3: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    
    //"a57" = "«TOLYSHNOMA»";
   // "a58" = ", созданного ";
    var body: some View {
        Group{
            Text("a49".localized(language)) +
            Text("a5".localized(language)).bold() +
            Text("a55".localized(language)) +
            Text("a57".localized(language)).bold() +
            Text("a58".localized(language)) +
            Text("a6".localized(language)).underline() +
            Text("a7".localized(language)) +
            Text("a8".localized(language)).underline() +
            Text("a9".localized(language)) +
          
            Text("a10".localized(language)).underline()
        
        }
    }
}

struct MainText3_Previews: PreviewProvider {
    static var previews: some View {
        MainText3()
    }
}
