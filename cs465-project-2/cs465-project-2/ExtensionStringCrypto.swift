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
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
        var digest = [UInt8](count:Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
        CC_SHA1(data.bytes, CC_LONG(data.length), &digest)
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joinWithSeparator("")
    }
    
    func toDecimal() -> String {
        let byte = toByte(self)
        return byte.toDecimal()
    }
    
    func toByte() -> Byte {
        return toByte(self)
    }
    
    // MARK: - Helper Methods -
    
    private func toByte(hex: String) -> Byte {
        return Byte(hex, radix: 16)!
    }
}