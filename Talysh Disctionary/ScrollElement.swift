//
//  ScrollElement.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 14.06.2021.
//

import SwiftUI

struct ScrollElement: View {
    @State var textMain : String
    @State var textPerevod : String
    
    @State var pasteboard = UIPasteboard.general
    
    var body: some View {
        VStack{
            HStack{
                Text(textMain).bold().font(.system(size: 24)).foregroundColor(.black).multilineTextAlignment(.leading)
                Spacer()
                Spacer()
            }.padding(.leading, 20)
          
            
            HStack{
                 
                // was .gray
                Text(textPerevod).multilineTextAlignment(.leading).foregroundColor(Color(red: 106/255, green: 106/255, blue: 106/255))
                Spacer(minLength: 50)
                Button(action: {
                    print(" copy elements")
                  
                    pasteboard.string = textPerevod
                }, label: {
                    Image(systemName: "doc.on.doc").font(.system(size: 20)).foregroundColor(.black)
                    
                }).padding(.bottom, 6)
            }.padding(.horizontal, 20)
            .padding(.vertical, 9)
        }.padding(.top, 14)
    }
}

struct ScrollElement_Previews: PreviewProvider {
    static var previews: some View {
        ScrollElement(textMain: "Специя", textPerevod: "фдыловадл:sdlfkjwklj2 32093lksdjflkjsdfkjwlkjffdkjflk2jflkjl2jflkjsdlkfjsdhjkfjk2hfkjhwefkjkj")
    }
}
