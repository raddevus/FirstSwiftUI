//
//  FirstTabView.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/29/23.
//

import SwiftUI

struct FirstTabView: View {
    @State var locationName = ""
    @State var toggle: Bool = false
    var body: some View {
        VStack {
            
            Button(action:{locationName = ""}) {
                Text("View One")
                    .onAppear(perform:{
                        print("View One onAppear Triggered")
                    })
                    .onDisappear(perform: {
                        print("View One onDisappear triggered")
                })
            }
            TextField("Enter vacation location", text: $locationName)
            Text(locationName)
        }
        HStack {
                    Image(systemName: "figure.arms.open")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(toggle ? .green : .red)
                        .opacity(toggle ? 1 : 0.2)
                    
                    if toggle {
                        Spacer()
                    }
                    
                    Toggle("Overlay", isOn: $toggle)

                }.animation(.default, value: toggle)

        
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
