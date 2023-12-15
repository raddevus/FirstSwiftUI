//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 4/23/23.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action:
                    {print("it worked")}){Text("simple")}
            Button(action:{
                if let url = URL(string:"https://newlibre.com/librestore"){
                UIApplication.shared.open(url)
            }
                
            }){
                Text("Load NewLibre")
            }.padding(5)
        }
        .padding()
    }
}

struct OtherView: View{
    var body : some View{
        LandmarkList()
    }
}
//extension ContentView: CBCentralManagerDelegate{
//    
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ContentView()
            OtherView()
        }
    }
    
}
