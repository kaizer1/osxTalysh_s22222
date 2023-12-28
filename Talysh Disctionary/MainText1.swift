//
//  MainText1.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 27.06.2021.
//

import SwiftUI

struct MainText1: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
     
    var body: some View {
         
        Group{
            Text("a1".localized(language)) +
             Text("a5".localized(language)).bold()  +
             Text("a13".localized(language)) +
             Text("a2".localized(language)).underline()
        }
       
          
    }
}

struct MainText1_Previews: PreviewProvider {
    static var previews: some View {
        MainText1()
    }
}
