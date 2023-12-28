//
//  AppNavigationBarCustom.swift
//  Talysh Disctionary
//
//  Created by Сергей Лоскутников on 11.04.2021.
//

import SwiftUI

struct AppNavigationBarCustom: View {
     
    enum NatigationItem {
        case perevod
        case aboutThis
        case suscrib
        case contact
        case alphabet
        case settings
    }
    
    
    @State private var selection: Set<NatigationItem> = [.perevod]
    
    
    var body: some View {
        NavigationView {
            //sidebarMain
            
           // TranslatorView()
             Text("aaa")
        }
    }
    
    
    
//    var sidebarMain : some View {
//        List(selection: $selection)
//        {
//            // Translate
//            NavigationLink(
//                destination: TranslatorView(),
//                label: {
//                    Text("Perevod")
//                })
//                .accessibility(label: Text("Parevod"))
//                .tag(NatigationItem.perevod)
//
//            // About app
//            NavigationLink(
//                destination: AboutAppView(),
//                label: {
//                    Text("About")
//                })
//                .accessibility(label: Text("About"))
//                .tag(NatigationItem.aboutThis)
//
//            // Subsribe
//            NavigationLink(
//                destination: SubscriptsView(),
//                label: {
//                    Text("Subsribes")
//                })
//                .accessibility(label: Text("Subsribes"))
//                .tag(NatigationItem.suscrib)
//
//            // Contacts
//            NavigationLink(
//                destination: ContactsView(),
//                label: {
//                    Text("Contact")
//                })
//                .accessibility(label: Text("Contact"))
//                .tag(NatigationItem.contact)
//
//            // Alphabets
//            NavigationLink(
//                destination:AlphabitView(),
//                label: {
//                    Text("Alphabet")
//                })
//                .accessibility(label: Text("Alphabet"))
//                .tag(NatigationItem.alphabet)
//
//            // Settings
//            NavigationLink(
//                destination: SettingsView(),
//                label: {
//                    Text("Settings")
//                })
//                .accessibility(label: Text("Settings"))
//                .tag(NatigationItem.settings)
//
//        }
//    }
}

struct AppNavigationBarCustom_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationBarCustom()
    }
}
