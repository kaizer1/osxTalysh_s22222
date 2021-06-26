//
//  ContactsView.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI


struct ContactsView: View {
    
    var body: some View {
         
        ZStack(alignment: .topLeading) {
           
                Color.white
            
                Text("Email: tolyshnoma@gmail.com")
                    .foregroundColor(.black)
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .padding( 20 )
        
    }
}



struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
