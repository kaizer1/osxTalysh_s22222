//
//  losObject.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import Foundation

class losObject : ObservableObject {
      
    @Published var mm : ViewW = .perevod
    @Published var shar : SharedData = SharedData()
    @Published var DataLos : DataHelp?
    @Published var ShowMenu : Bool = false
    
    init() {
        
        do {
            try DataLos = DataHelp()
            print("Success! Yum.")
        } catch {
        print("Invalid Selection.")}
    }
}
