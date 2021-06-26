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
    @State private var selectionDicti1 = LocalizationService.shared.backLang()
    @State private var selectionDicti2 = EnumDicti.dictiTalysh
    @State private var translateIs = true
    @State private var wordToSee : [WordToSee]?
    @EnvironmentObject var ss2 : losObject
   
    
    
    // was EnumDicti
    func losExcelent(trans: Languages, namess : String) throws -> [WordToSee] { // was String
          
        var aLib : String = "ru"
          
          
          print(" my string to translate == \(namess)")
          
        switch trans {
        case Languages.rus:
            print(" ru is case ")
            aLib = "ru"
            
        case Languages.Eng:
            print(" en is case ")
            aLib = "en"
            
        case Languages.azer:
            print(" az is case ")
            aLib = "az"
            
        case Languages.farci:
            print(" fa is case ")
            aLib = "fa"
            
        }
         
        let buttonsTL = NSLocalizedString("hello", comment: "the name of ")
        print(" my b \(buttonsTL)")
        
        
        let buttonNK = NSLocalizedString("hello", comment: "sfwf")
        print(" my d \(buttonNK)")
         
        let a = try ss2.DataLos?.TranslateWord(libraryActive:  aLib, transS: namess)
       
        print(" my a in translates == \(String(describing: a))")
        return a!
    }
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                 
                HStack() {
                     
                    if #available(iOS 14.0, *) {
                        Picker(selectionDicti1.description, selection: $selectionDicti1){
                            Text(Languages.rus.description).tag(Languages.rus)
                            Text(Languages.Eng.description).tag(Languages.Eng)
                            Text(Languages.azer.description).tag(Languages.azer)
                            Text(Languages.farci.description).tag(Languages.farci)
                        }.padding()
                        .pickerStyle(MenuPickerStyle())
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    
                    Image(systemName: "arrow.left.arrow.right").font(.system(size: 20)).onTapGesture {
                        print("change lang ")
                        
                        //let atempDicti = selectionDicti1
                      //  selectionDicti1 = selectionDicti2
                      //  selectionDicti2 = atempDicti
                        
                    }
                    
                    if #available(iOS 14.0, *) {
                        Picker(selectionDicti2.description, selection: $selectionDicti2){
                            Text(ss2.shar.valueLang ? "Russian" : "Русский ").tag(ss2.shar.valueLang ? EnumDicti.dictiRusEn : EnumDicti.dictiRus)
                            Text(ss2.shar.valueLang ? "Talysh" : "Талышский").tag(ss2.shar.valueLang ? EnumDicti.dictiTalyshEn : EnumDicti.dictiTalysh)
                            Text(ss2.shar.valueLang ? "Azerbaijani" : "Азербайджанский").tag(ss2.shar.valueLang ? EnumDicti.dictiFarsiEn : EnumDicti.dictiFarsi)
                            Text(ss2.shar.valueLang ? "English" : "Английский").tag(ss2.shar.valueLang ? EnumDicti.dictiEngEn : EnumDicti.dictiEng)
                            Text(ss2.shar.valueLang ? "Persian" : "Персидский").tag(ss2.shar.valueLang ? EnumDicti.dictiPercEn :EnumDicti.dictiPerc)
                        }.padding()
                        .pickerStyle(MenuPickerStyle())
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
                           wordToSee = try losExcelent(trans: selectionDicti1, namess: value)
                    
                           wordToSee?.reverse()
                    
                          if wordToSee!.isEmpty{
                            translateIs = true
                    
                          }else {
                               translateIs = false
                          }
                   } catch {
                    print("Invalid 2233S election.")}
                    
                }
                }
                    )
                
                
//                HStack{
//                    Spacer()
//                    Button("transbutton".localized(language)){
//
//                        do {
//
//                            wordToSee?.removeAll()
//                            hideKeyboard()
//                            wordToSee = try losExcelent(trans: selectionDicti1, namess: titleInput)
//
//                            wordToSee?.reverse()
//
//                            if wordToSee!.isEmpty{
//                                translateIs = true
//
//                            }else {
//                                translateIs = false
//                            }
//
//                            print("Sus")
//                        } catch {
//                        print("Invalid 2233S election.")}
//
//                    }
//                }.padding()
            }
        }
    }
    
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
