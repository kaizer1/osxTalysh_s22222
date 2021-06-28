//
//  View1.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI


struct View1: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @State private var title: String = ""
    @State private var titleInput: String = ""
    // was // @State private var selectionDicti1 = EnumDicti.dictiRus
    @State private var selectionDicti1 = Languages.rus
    @State private var selectionDicti2 = Languages.taly
    @State private var translateIs = true
    @State private var wordToSee : [WordToSee]?
    @EnvironmentObject var ss2 : losObject
     
    
    func returnNameLangu(lib: Languages) -> String {
        
        var nameLanguage : String = ""
         
        switch lib {
        case .rus:
            print(" ru is case ")
            nameLanguage = "ru"
            
        case .Eng:
            print(" en is case ")
            nameLanguage = "en"
            
        case .azer:
            print(" az is case ")
            nameLanguage = "az"
            
        case .farci:
            print(" fa is case ")
            nameLanguage = "fa"
            
        case .taly:
        print(" talys")
            nameLanguage = "ty"
             
            
        }
        
        
        return nameLanguage
    }
    
    
    // was EnumDicti  rans2: selectionDicti2,
    func losExcelent(trans: Languages, trans2: Languages, namess : String) throws -> [WordToSee] { // was String
          
        let nameLibFromTranslate = returnNameLangu(lib: trans)
        let nameLibToTranslate = returnNameLangu(lib: trans2)
          
          print(" my string to translate == \(namess)")
  
        let a = try ss2.DataLos?.TranslateWord(libraryActive:  nameLibFromTranslate, libraryActive2: nameLibToTranslate, transS: namess)
     
       // let a = try ss2.DataLos?.TranslateWord(libraryActive:  aLib, transS: namess)
       
        return a!
    }
    
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 15){
                 
                HStack{
                    
                    if #available(iOS 14.0, *) {
                        Picker(selectionDicti1.description.localized(language), selection: $selectionDicti1){
                            Text("lanRu".localized(language)).tag(Languages.rus)
                            Text("lanEn".localized(language)).tag(Languages.Eng)
                            Text("lanFa".localized(language)).tag(Languages.farci)
                            Text("lanAz".localized(language)).tag(Languages.azer)
                            Text("lanTy".localized(language)).tag(Languages.taly)
                        
                        } .padding( .all, 14)
                        .pickerStyle(MenuPickerStyle())
                        .onChange(of: selectionDicti1, perform: { value in
                          
                         
                            if( selectionDicti1 == .taly){
                             
                                if selectionDicti2 == .taly {
                                    selectionDicti2 = .Eng
                                }
                            } else {
                                
                                selectionDicti2 = .taly
                            } } )
                        
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    
                    Image(systemName: "arrow.left.arrow.right").font(.system(size: 20)).onTapGesture {
                        
                        
                        let atempDicti = selectionDicti1
                        selectionDicti1 = selectionDicti2
                        selectionDicti2 = atempDicti
                        
                    }
                    
                    if #available(iOS 14.0, *) {
                        Picker(selectionDicti2.description.localized(language), selection: $selectionDicti2){
                            Text("lanRu".localized(language)).tag(Languages.rus)
                            Text("lanEn".localized(language)).tag(Languages.Eng)
                            Text("lanFa".localized(language)).tag(Languages.farci)
                            Text("lanAz".localized(language)).tag(Languages.azer)
                            Text("lanTy".localized(language)).tag(Languages.taly)
                        }
                        .padding(.all, 14)
                        .pickerStyle(MenuPickerStyle())
                        .onChange(of: selectionDicti2, perform: { value in
                             
                            if selectionDicti2 == .taly {
                                
                                if selectionDicti1 == .taly {
                                    selectionDicti1 = .rus
                                }
                            } else {
                                selectionDicti1 = .taly
                            }
                              
                        })
                    } else {
                        // Fallback on earlier versions
                    }
                }
                     
                  
                //Spacer()
                
                
                ScrollView(.vertical){
                    
                    
                    if translateIs {
                      
                        Text("noTrans".localized(language)).font(.system(size: 24)).bold().padding(.top, 40)
                         
                    }else {
                        
                       // for wo in wordToSee {
                        ForEach(wordToSee!, id: \.self) { worr in
                            ScrollElement(textMain: worr.mainWord, textPerevod: worr.Translate)
                        }
                    }
                }
               
                TextField("enterText1".localized(language), text: $titleInput, onCommit: {
                     print(" my input test == \($titleInput)")

                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .padding(.all, 15)
                .shadow(color: .black, radius: 3, x: 1, y: 0.0)
                .onChange(of: titleInput, perform: { value in
                    print("change calues " )
                    
                     
                    if value.count == 0 {
                         
                        wordToSee?.removeAll()
                        hideKeyboard()
                        
                    }else {
                    
                    do{
                           wordToSee?.removeAll()
                           //hideKeyboard()
                           wordToSee = try losExcelent(trans: selectionDicti1, trans2: selectionDicti2, namess: value)
                    
                           wordToSee?.reverse()
                    
                          if wordToSee!.isEmpty{
                            translateIs = true
                    
                          }else {
                               translateIs = false
                          }
                   } catch {
                    print("Invalid 2233S election.")}
                    
                } })
                
             } // vertical
            } // zstack
        }
  //  }
    
    func assignTitle(){
        self.title = self.titleInput
        self.titleInput = ""
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
//struct View1_Previews: PreviewProvider {
//    static var previews: some View {
//        View1( DataHelp: )
//    }
//}
