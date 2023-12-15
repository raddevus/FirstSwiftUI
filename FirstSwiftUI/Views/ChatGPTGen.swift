//
//  ChatGPTGen.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/27/23.
//

import SwiftUI

struct ChatGPTGen: View {
    var body: some View {
        VStack{
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .padding()
            Button(action: {
                print("Button tapped!")
            }){
                Text("Tap me")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ChatGPTGen_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTGen()
    }
}
