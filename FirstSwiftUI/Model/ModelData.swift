//
//  ModelData.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/23/23.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")
var counter = 0

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    counter = counter + 1
    print("I'm loading data from landmarkData.json : \(counter)")
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }
    catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    }
    catch{
        fatalError("Couldn't parse \(filename) \(T.self):\n\(error)")
    }
}
