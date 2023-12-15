//
//  SecondTabView.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/29/23.
//

import SwiftUI

struct SecondTabView: View {
    var body: some View {
        Text("View TWO")
            .onAppear(perform:{
                print("View One onAppear Triggered")
            })
            .onDisappear(perform: {
                print("View TWO onDisappear triggered")
            })
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
