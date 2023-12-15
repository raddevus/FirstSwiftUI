//
//  FailView.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 12/10/23.
//

import SwiftUI

struct FailView: View {
    
    func createData(){
     
        var extra = "this is special".data(using:String.Encoding.utf8)
        let b64Out = extra?.base64EncodedString()
        print("b64Out: \(b64Out ?? "")")
        let myB64String = b64Out ?? ""
        
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        var plainText = "test this1 3 4 5 5 2 2"
        
        Button("Create Data"){
            createData()
        }
        
        //var plainTextData = Data(base64Encoded: plainText)!
        
    }
}

#Preview {
    FailView()
}
