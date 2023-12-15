//
//  Crypton.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 12/10/23.
//

import Foundation
import CommonCrypto


//###############################################################
//###############################################################
// processData method does both encryption & decryption since
// there are only one difference in the method to do encryption
// versus decryption.
//###############################################################
//###############################################################

func processData(targetData: Data, key: Data, iv: Data, isEncrypt: Bool = true) throws -> Data? {

    // Output buffer (with padding)
    
    let outputLength = targetData.count + kCCBlockSizeAES128
    
    var outputBuffer = Array<UInt8>(repeating: 0,
                                    count: outputLength)
    //var outputBuffer: [UInt8] = []
    var numBtyesProcessed = 0
    
    var encryptDecrypt :Int = 0
    if isEncrypt{
        // the int value of kCCEncrypt is 0
        encryptDecrypt = kCCEncrypt
    }
    else{
        // the int value of kCCDecrypt is 1
        encryptDecrypt = kCCDecrypt
    }
    
    let status = CCCrypt(CCOperation(encryptDecrypt),
                         CCAlgorithm(kCCAlgorithmAES),
                         CCOptions(kCCOptionPKCS7Padding),
                         Array(key),
                         kCCKeySizeAES256,
                         Array(iv),
                         Array(targetData),
                         targetData.count,
                         &outputBuffer,
                         outputLength,
                         &numBtyesProcessed)

    guard status == kCCSuccess else { return nil }
    print ("numBytesProcessed: \(numBtyesProcessed)")
    //let outputBytes = iv + outputBuffer.prefix(numBytesEncrypted)
    let outputBytes = outputBuffer.prefix(numBtyesProcessed)
    return Data( outputBytes)
}

func stringToBytes(_ string: String) -> [UInt8]? {
    let length = string.count
    if length & 1 != 0 {
        return nil
    }
    var bytes = [UInt8]()
    bytes.reserveCapacity(length/2)
    var index = string.startIndex
    for _ in 0..<length/2 {
        let nextIndex = string.index(index, offsetBy: 2)
        if let b = UInt8(string[index..<nextIndex], radix: 16) {
            bytes.append(b)
        } else {
            return nil
        }
        index = nextIndex
    }
    return bytes
}

