//
//  Sha256View.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 12/9/23.
//

import SwiftUI
import CommonCrypto

struct Sha256View: View {
    @State private var hashKey = ""
    func hashString(_ input: String, _ hashCount: Int) -> String {
        var output = input
        for _ in 0...hashCount{
            
            output = "4088" + output
            output =  output.sha256()
        }
        //print(output)
        return output
    }
    
    func decryptData() -> String{
        let keyData = Data(stringToBytes("ce9b59200d67a6f0c931148bfd7ad1dec47011ab965035b8f10b3271556bbd0f")!)
        let iv = Data(stringToBytes("1b8d17cdebb12fdfb87a0d2fbbe18c38")!)
        
        let encryptedData = Data(base64Encoded: "ju16W3qc0wP6Us6GGKdPRzmeZjrzgEGDKimPDVufX0E=" ,options : Data.Base64DecodingOptions.ignoreUnknownCharacters)


        
        let contents : Data?
            do {
                contents = try processData(targetData: encryptedData!,key: keyData, iv: iv, isEncrypt: false)
                print ("\(contents?.base64EncodedString() ?? "")")
            }
        catch  {
               print ("\(error)")
            return "failed!"
            }
        return (contents?.base64EncodedString())!
    }
    
    func encryptData() -> String{
                
        // ju16W3qc0wP6Us6GGKdPRzmeZjrzgEGDKimPDVufX0E=
        // ju16W3qc0wP6Us6GGKdPRzmeZjrzgEGDKimPDVufX0E=
        
        let plainTextData = "test SUPER @%@$#$* 🤑🤓".data(using:String.Encoding.utf8)
        let keyData = Data(stringToBytes("ce9b59200d67a6f0c931148bfd7ad1dec47011ab965035b8f10b3271556bbd0f")!)
                                    //.data(using: String.Encoding.utf8)
        let iv = Data(stringToBytes("1b8d17cdebb12fdfb87a0d2fbbe18c38")!)
            //.data(using: String.Encoding.utf8)
          
// c3 dd db a2 75 6e aa d5 b6 d8 3a e3 e0 7b 59 df
        
        let contents : Data?
            do {
                contents = try processData(targetData: plainTextData!,key: keyData, iv: iv)
                print ("\(contents?.base64EncodedString() ?? "")")
            }
        catch  {
               print ("\(error)")
            return "failed!"
            }

        
        return (contents?.base64EncodedString())!
    }
    
    var body: some View {
        
        
        Text(hashString("supersite", 0)).padding()
        Text(encryptData()).padding()
        Text("Yikes!")
        Text(String.fromBase64(decryptData()) ?? "")
        //Text(hashKey)
    }
}

#Preview {
    Sha256View()
}
