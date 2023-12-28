//
//  ContactsView.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI


struct ContactsView: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    
    
    var body: some View {
         
        VStack {
           
               
            
            Text("textBlago1".localized(language)).bold()
                .foregroundColor(.black) + Text("textBlago2".localized(language)).foregroundColor(.blue) + Text("textBlago3".localized(language)).bold()
              
             Spacer()
            Spacer()
             
            }
        
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        
        .padding( 16 )
        .padding(.top, 10)
        
    }
    
    //.Enviroment(\.)
}



struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
