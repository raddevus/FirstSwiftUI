//
//  CYaPassView.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/30/23.
//

import SwiftUI

struct CYaPassView: View {
    @State var results = [CYaPass]()
    @State var atime = ActionClock()
    var body: some View {
        
        VStack {
            Text("value -> \(atime.message)")
                    .onAppear(perform: loadTime)
                           
            List(results, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text("\(item.key)  \(item.created)")
                    }
            }.onAppear(perform: loadData)
            
         }
        }
     
    
    func loadTime() {
        guard let url = URL(string: "https://actionmobile.app/GetTime" ) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print("data: \(data) \(Date())")
                do {
                    let response = try JSONDecoder().decode(ActionClock.self, from: data)
                    print("is this called?")
                    DispatchQueue.main.async {
                        self.atime = response
                        print("in LOADTIME")
                    }
                    print("response: \(response)")
                    return
                    
                }catch {
                    print ("\(error)")
                }
            }
        }.resume()
    }
    
    func loadData() {
            guard let url = URL(string: "https://newlibre.com/librestore/data/getalltokens?pwd=ThisIsAnExtr3m3lyLongCod3" ) else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    print("data: \(data) \(Date())")
                    if let response = try? JSONDecoder().decode([CYaPass].self, from: data) {
                        print("is this called?")
                        DispatchQueue.main.async {
                            self.results = response
                            print("in here")
                        }
                        //print("response: \(response)")
                        return
                    }
                }
                else{
                    print("I failed")
                }
            }.resume()
        }
}

struct CYaPassView_Previews: PreviewProvider {
    static var previews: some View {
        CYaPassView(results: [CYaPass]())
    }
}
