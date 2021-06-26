// created Sergei Loskutnikov 2021

import SwiftUI

struct ContentView: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @EnvironmentObject var ss : losObject

    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

         UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 252/255, green: 134/255, blue: 8/255, alpha: 0.5)
        UINavigationBar.appearance().isTranslucent = false

        
     }
    
    
    //@State var showMenu = false
    
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        //self.showMenu = false
                        self.ss.ShowMenu = false
                    }
                }
                
            }
        
            .onChanged {
                if $0.translation.width > 100 {
                    withAnimation{
                        self.ss.ShowMenu = true
                    }
                }
            }
           
            // was   MainView(showMenu: ss.$ShowMenu)
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.ss.ShowMenu ? (geometry.size.width/2 + geometry.size.width/4) : 0)
                        .disabled(self.ss.ShowMenu ? true : false)
                    if self.ss.ShowMenu {
                        MenusView()
                            .frame(width: (geometry.size.width/2 + geometry.size.width/4))
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
            .navigationBarTitle("Talysh_Dictionary".localized(language), displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.ss.ShowMenu.toggle()
                        }
                    }) {
                      //  Image(systemName: "line.horizontal.3")
                       //     .imageScale(.large)
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                        
                        
                    }
                ))
            
//              .onTapGesture {
//                //self.menuClose()
//                self.showMenu.toggle()
//            }
            
        }
    }
}

// three views

//            case .subsribe:/
//SubsrcView().environmentObject(ss)

struct MainView: View {
    
   // @Binding var showMenu: Bool
    //@State var vi : ViewW = .view1
    @EnvironmentObject var ss : losObject
    
    var body: some View {
        
        
        ZStack(){
            
            switch ss.mm {
            
            case .perevod:
                View1().environmentObject(ss)
            
            case .about_app:
                View2().environmentObject(ss)
                
                
            case .contanc:
                ContactsView()
                
            case .alhpa:
                AlphaView()
                
            case .setting:
                SettinView().environmentObject(ss)
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
