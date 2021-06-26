//
//  SettinView.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI


enum Languages : String, CaseIterable, Identifiable {
    case rus
    case Eng
    case azer
    case farci
    
    var id : String { self.rawValue }
    
    var description: String {
       get {
         switch self {
           case .rus:
             return "Русский"
         case .Eng:
           return "English"
    
         case .azer:
           return "Azərbaycan dili"
       case .farci:
         return "فارسی"
         }
       }
  }
}


struct SettinView: View {
    
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    
    //       Picker(selectionL.description, selection: $selectionL
    @State private var selectionL = Languages.rus
    @State private var selection3 = LocalizationService.shared.backLang()
    @EnvironmentObject var ss2 : losObject
    
    var body: some View {
        
        HStack {
          
            VStack (alignment: .leading) {
                Group {
                    Text("Select_Language".localized(language))
                    
                    if #available(iOS 14.0, *) {
                        Picker(selection3.description, selection: $selection3){
                            Text(Languages.rus.description).tag(Languages.rus)
                            Text(Languages.Eng.description).tag(Languages.Eng)
                            Text(Languages.azer.description).tag(Languages.azer)
                            Text(Languages.farci.description).tag(Languages.farci)
                            //Text("Azərbaycan dili").tag(false)
                           // Text("Farci").tag(false)
                        }.onChange(of: selection3, perform: { value in
                            print(" aslkdjfhkasdfhjk")
                            
                            switch(selection3){
                            case Languages.rus:
                                                            LocalizationService.shared.language = .russian
                                selection3 = .rus
                                
                            case Languages.Eng:
                                                            LocalizationService.shared.language = .english_us
                                selection3 = .Eng
                                
                            case Languages.azer:
                                                            LocalizationService.shared.language = .aizer
                                selection3 = .azer
                                
                            case Languages.farci:
                                                            LocalizationService.shared.language = .farci
                                selection3 = .farci
                                
                            }
                             
                        })
                        
                        .padding(.leading, 25)
                        .pickerStyle(MenuPickerStyle())
                        
                    } else {
                        // Fallback on earlier versions
                         
                    }
                }
                .padding(.all, 16)
                Spacer()
                Spacer()
                
                
          
            }
            
            Spacer()
            Spacer()
            
        }
         
       
    }
    
}

struct SettinView_Previews: PreviewProvider {
    static var previews: some View {
        SettinView()
    }
}
