//
//  MenusView.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 29.03.2021.
//

import SwiftUI

//struct MenusView: View {
struct MenusView: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
          //  perevod, about_app, subsribe, contanc, alhpa, setting
        @EnvironmentObject var ss2 : losObject
        
        var body: some View {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image(systemName: "bold.italic.underline")
                        .foregroundColor(.black)
                    Text("Translate".localized(language))
                        .foregroundColor(.black)
                        .font(.headline)
                }.onTapGesture {
                    print("  О приложении")
                    ss2.mm = .perevod
                    ss2.ShowMenu.toggle()
                }
                .padding(.top, 20)
                
                
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.black)
                    Text("hello".localized(language))
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 20).onTapGesture {
                    print(" messsages ")
                    ss2.mm = .about_app
                    ss2.ShowMenu.toggle()
                }

                //.padding(.top, 20)
                // was icons == rectangle.stack.person.crop.fill"
                HStack {
                    Image(systemName: "figure.wave.circle")
                        .foregroundColor(.black)
                    Text("contacts".localized(language))
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 20).onTapGesture {
                    print(" messsages ")
                    ss2.mm = .contanc
                    ss2.ShowMenu.toggle()
                }
                HStack {
                    Image(systemName: "text.cursor")
                        .foregroundColor(.black)
                    Text("Alphabet".localized(language))
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 20).onTapGesture {
                    print(" alpha ")
                    ss2.mm = .alhpa
                    ss2.ShowMenu.toggle()
                }
                
                
                HStack {
                   Image(systemName: "gearshape.fill")
                        .foregroundColor(.black)
                    Text("Settings".localized(language))
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 20).onTapGesture {
                    print(" setti ")
                    ss2.mm = .setting
                    ss2.ShowMenu.toggle()
                }
                
                Spacer()
            }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
        }
    }



struct MenusView_Previews: PreviewProvider {
    static var previews: some View {
            MenusView()
        }
}



    //            HStack {
    //                Image(systemName: "dollarsign.circle.fill")
    //                    .foregroundColor(.black)
    //                Text(ss2.shar.valueLang ? "  Subscribe" :"  Подписки")
    //                    .foregroundColor(.black)
    //                    .font(.headline)
    //            }.onTapGesture {
    //                print(" Settings ")
    //                ss2.mm = .subsribe
    //            }
