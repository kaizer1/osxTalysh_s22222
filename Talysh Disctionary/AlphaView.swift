//
//  AlphaView.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI
 

struct easyGrid : Identifiable{
    var tex1 : String
    var tex2 : String
    var tex3 : String

    var id = UUID()
}

struct AlphaView: View {
    
    let data =  [
        easyGrid(tex1:"A", tex2: "а, آ", tex3: "(a)"),
        easyGrid(tex1:"Б", tex2: "b, ب", tex3: "(b)"),
        easyGrid(tex1:"В", tex2: "v, و", tex3: "(v)"),
        easyGrid(tex1:"Г", tex2: "q, گ", tex3: "(g)"),
        easyGrid(tex1:"Ғ", tex2: "ğ, ق", tex3: "(gh)"),
        easyGrid(tex1:"Д", tex2: "d, د", tex3: "(d)"),
        easyGrid(tex1:"Е", tex2: "e, إ", tex3: "(e)"),
        easyGrid(tex1:"Ә", tex2: "ә, ا,ع", tex3: "( )"),
        easyGrid(tex1:"Ж", tex2: "j, ژ", tex3: "(zh)"),
        easyGrid(tex1:"З", tex2: "z, ز", tex3: "(z)"),
        easyGrid(tex1:"И", tex2: "i, ی", tex3: "(i)"),
        easyGrid(tex1:"Ы", tex2: "ı, ع", tex3: "(y)"),
        easyGrid(tex1:"J", tex2: "y, ی", tex3: "(y)"),
        easyGrid(tex1:"К", tex2: "k, ک", tex3: "(k)"),
        easyGrid(tex1:"Л", tex2: "l, ل", tex3: "(l)"),
        easyGrid(tex1:"М", tex2: "m, م", tex3: "m)"),
        easyGrid(tex1:"Н", tex2: "n, ن", tex3: "(n)"),
        easyGrid(tex1:"О", tex2: "o, و", tex3: "(o)"),
        easyGrid(tex1:"П", tex2: "p, پ", tex3: "(p)"),
        easyGrid(tex1:"Р", tex2: "r, ر", tex3: "(r) "),
        easyGrid(tex1:"С", tex2: "s, س", tex3: "(s)"),
        easyGrid(tex1:"Т", tex2: "t, ت", tex3: "(t)"),
        easyGrid(tex1:"У", tex2: "u, و", tex3: "(u)"),
        easyGrid(tex1:"Ф", tex2: "f, ف", tex3: "(f)"),
        easyGrid(tex1:"Х", tex2: "x, خ", tex3: "(kh)"),
        easyGrid(tex1:"Һ", tex2: "h, ه", tex3: "(h)"),
        easyGrid(tex1:"Ч", tex2: "ç, چ", tex3: "(ch)"),
        easyGrid(tex1:"Ҹ", tex2: "с, ج", tex3: "(dzh) "),
        easyGrid(tex1:"Ш", tex2: "ş, ش", tex3: "(sh)"),
    
    ]
    
    
    //  GridItem(.adaptive(minimum: 80))
    // was         GridItem(.fixed(40), spacing: 16),
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    
    var body: some View {
              
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(data, id: \.id) { item in
                        VStack{
                            Text(item.tex1).font(.system(size: 22)).bold().padding(3)
                            Text(item.tex2).padding(2)
                            Text(item.tex3).font(.system(size: 18)).bold().padding(3)
                        }
                  }
        }
    }
}

struct AlphaView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlphaView()
            AlphaView()
        }
    }
}
