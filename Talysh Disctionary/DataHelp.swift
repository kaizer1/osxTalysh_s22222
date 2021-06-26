//
//  DataHelp.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 17.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import Foundation
//import SQLite // if active swift.packages

//import SQLite3

import SQLite.Swift // if active POD


struct WordToSee : Hashable {
    var mainWord : String
    var Translate : String
    
}


class DataHelp {
    
    var db : Connection?
    var wordss : [WordToSee] = []
     
    func aBublik() throws {
         
        let mPath = Bundle.main.path(forResource: "db_data", ofType: "db")
        db = try Connection(mPath!)
    
        //     throw Error.Protocol
        
    }
     
     
    init() throws{
          
          try aBublik()
    
    }
    
    
    deinit {
         // close
          
         
       }
    
    func TranslateWord(libraryActive: String, transS: String) throws -> [WordToSee] { // was String
        
        wordss.removeAll()
  
        var a : String = ""
        var lizad2 : String = ""
        var lizard3 : String = ""
       
        if(libraryActive == "en"){
            lizad2 = transS.lowercased()
            lizard3 = transS.lowercased()
           // lizad2.append(" ")
              
            if lizad2.last == " "{
              //  lizad2.append(" ")
                print("a ksdjfklsdjfkl remove ats")
              lizad2.removeLast()
                
            }else {
                print("append emplt ")
                lizad2.append(" ")
            }
             
            
        }else if libraryActive == "ru"{
            lizad2 = transS.uppercased()
        }else{
            lizad2 = transS.lowercased()
        }
         
      
        print(" my word to translate2  = \(lizad2)")
        print(" my word to translate3  = \(lizard3)")
        let users = Table(libraryActive) // was "ru"
         
        
       // let id = Expression<Int64>("id") // was ""
        let word = Expression<String>("word")
        let transL = Expression<String>("translate")
        
        if !lizad2.isEmpty{
            print(" not empty !! ")
            let ase = users.filter(word.like("%" + lizad2 + "%")).limit(10)

            for wkej2 in try db!.prepare(ase){

                let sdw = try wkej2.get(word)
                let bub = try wkej2.get(transL)
                wordss.append(WordToSee(mainWord: sdw, Translate: bub))
            }
        }
        
        if !lizard3.isEmpty{
            print(" not empty !! ")
            let ase = users.filter(word.like("%" + lizard3 + "%")).limit(10) // was without limit

            for wkej3 in try db!.prepare(ase){

                let sdw = try wkej3.get(word)
                let bub = try wkej3.get(transL)
                wordss.append(WordToSee(mainWord: sdw, Translate: bub))
            }
        }
        
        
        
        if(libraryActive == "en") {
            print("en lizard3 ")
        for  query23 in try db!.prepare(users.where(word == lizard3).limit(1)){
            a = try query23.get(transL)
            let b = try query23.get(word)
             
            print( "word and translate == \(a) and \(b)")
            
            if let indexRemove = wordss.firstIndex(of: WordToSee(mainWord: b, Translate: a)){
                wordss.remove(at: indexRemove)
            }
             
            wordss.append(WordToSee(mainWord: b, Translate: a))
         
          }
        }
      
        
        

        for  query22 in try db!.prepare(users.where(word == lizad2).limit(1)){
            a = try query22.get(transL)
            let b = try query22.get(word)
             
            
            if let indexRemove = wordss.firstIndex(of: WordToSee(mainWord: b, Translate: a)){
                wordss.remove(at: indexRemove)
            }
             
             
            wordss.append(WordToSee(mainWord: b, Translate: a))
            
        }
         
      
        return wordss
    }
    
    
    
    func addWordToDataBase() -> Bool {
          
        
         
        return true
    }
    
}

//let db = try Connection("path/to/db.sqlite3")
