//
//  ExtensionStringCrypto.swift
//  cs465-project-2
//
//  Created by Kyle Pontius on 9/13/16.
//  Copyright © 2016 Kyle Pontius. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - General Methods -
    
    func sha1(truncateLength: Int = 0) -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1((data as NSData).bytes, CC_LONG(data.count), &digest)
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined(separator: "")
    }
    
    var drop0xPrefix:          String { return hasPrefix("0x") ? String(characters.dropFirst(2)) : self }
    var drop0bPrefix:          String { return hasPrefix("0b") ? String(characters.dropFirst(2)) : self }
    var hexaToDecimal:            Int { return Int(drop0xPrefix, radix: 16) ?? 0 }
    var hexaToBinaryString:    String { return String(hexaToDecimal, radix: 2) }
    var decimalToHexaString:   String { return String(Int(self) ?? 0, radix: 16) }
    var decimalToBinaryString: String { return String(Int(self) ?? 0, radix: 2) }
    var binaryToDecimal:          Int { return Int(drop0bPrefix, radix: 2) ?? 0 }
    var binaryToHexaString:    String { return String(binaryToDecimal, radix: 16) }
    
    func truncate(bitLength: Int) -> String {
        var currentString = self
        var result = ""
        
        for _ in 0 ..< bitLength {
            result += String(currentString.remove(at: currentString.startIndex))
        }
        
        return result
    }
    
    func convertHexToBinaryString() -> String {
        var result = ""
        
        for character in characters {
            let hexString = String(character).hexaToBinaryString
            result += padBinary(binary: hexString)
        }
        
        return result
    }
//
//    // MARK: - Helper Methods -
//    
//    fileprivate func hexToByte(hex: String) -> Byte {
//        return Byte(Int(hex, radix: 16)!)
//    }
//    
    fileprivate func padBinary(binary: String, totalSize: Int = 4) -> String {
        var result = binary
        
        for _ in 0 ..< totalSize - binary.characters.count {
            result.insert("0", at: result.startIndex)
        }
        
        return result
    }
}
