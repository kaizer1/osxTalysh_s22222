//
//  SubsrcView.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct SubsrcView: View {
    
    @EnvironmentObject var ss2 : losObject
    
    var body: some View {
        VStack{
            Group {
               
                Text( ss2.shar.valueLang ? "One year subscription - unlimited access" : "Подписка на год - неограниченный доступ").bold().padding(9).multilineTextAlignment(.center).allowsTightening(true)
                Text(ss2.shar.valueLang ? "With this subscription you get access to all translations for a year" : "C данной подпиской вы получаете доступ ко всем переводам на год").padding(8).multilineTextAlignment(.center)
                Text(ss2.shar.valueLang ? "Status: not active" : "Статус: не активна ").foregroundColor(Color.red).padding(8)
                Text(ss2.shar.valueLang ? "Value" : "Стоимость: 369  Р " ).bold()
                    .padding(10)
                Button(action: {
                    print(" subscript enter ")
                    //ss2.shar.ShaderRead()
                }) {
                    Text(ss2.shar.valueLang ? "subscribe" :  "Подписаться")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(.system(size: 32))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                     
                        
                }.background(Color.orange)
                .cornerRadius(40)
                .padding(24)
                
                // "ОФОРМИТЬ ПОДПИСКУ
            }
     
            
        }.multilineTextAlignment(.center)
    }
}


//   .frame(maxWidth: .infinity)
//.frame(height: 50)
//.background(GoogleButton ? Color.white : Color.black)
 //           .cornerRadius(14.0)
//.padding(.horizontal, 2)
//.padding(.vertical, 1)

struct SubsrcView_Previews: PreviewProvider {
    static var previews: some View {
        SubsrcView()
    }
}
