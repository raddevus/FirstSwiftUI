//
//  ToggleEx.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 7/5/23.
//

import SwiftUI

struct ToggleEx: View {
    
    @State private var wifiEnabled = true
    @State private var currentDateTime = Calendar.current

    @State private var userName = ""
var body: some View {

        VStack {
            Toggle(isOn: $wifiEnabled) {
              Text("Enable Wi-Fi")
            }

            TextField("Enter user name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
            Text("\(Date())")
            Text("Hello, World!")
                .frame(width: 300, height: 100)
                .onTapGesture {
                    print(type(of: self.body))
                }
        }
    }
}

struct ToggleEx_Previews: PreviewProvider {
    static var previews: some View {
        ToggleEx()
    }
}
