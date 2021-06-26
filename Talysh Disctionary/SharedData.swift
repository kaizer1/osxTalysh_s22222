//
//  SharedData.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 15.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import Foundation


class SharedData  {
   
    public var valueLang = Bool()
    private let  stinName = "currentLanguage"
    
    init() {
        
         print(" init this aaaaa is ok " )
         valueLang = ShaderRead()
    }
    
    
    func ShaderWrite(inLos: Int){
        let preferences = UserDefaults.standard
        if inLos == 2 {
            valueLang = true
           
        } else {
            valueLang = false
          
        }
     
        let currentLevel =  inLos
//       let currentLevel = 7 + inLos
       //let currentLevelKey = "currentLanguage"
       preferences.set(currentLevel, forKey: stinName)
        
    }
    
    
    func ShaderRead() -> Bool {
        
        let preferences = UserDefaults.standard

       // let currentLevelKey = "currentLanguage"
        if preferences.object(forKey: stinName) == nil {
            //  Doesn't exist
            print(" not exists data ")
            return false
        } else {
            let currentLevel = preferences.integer(forKey: stinName)
            print(" my level == \(currentLevel)" )
            if currentLevel == 2 {
                valueLang = true
            }else {
                valueLang = false
            }
            return true
        }
        
       
    }
    

}
    


