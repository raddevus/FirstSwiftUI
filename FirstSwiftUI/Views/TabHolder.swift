//
//  TabHolder.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/29/23.
//

import SwiftUI

struct TabHolder: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem{
                Text("First")
            }
            SecondTabView()
                .tabItem{Text("Second")
                }
        }
    }
}

struct TabHolder_Previews: PreviewProvider {
    static var previews: some View {
        TabHolder()
    }
}
