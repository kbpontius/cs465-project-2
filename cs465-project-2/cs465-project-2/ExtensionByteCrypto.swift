//
//  ExtensionByteCrypto.swift
//  cs465-project-2
//
//  Created by Kyle Pontius on 9/13/16.
//  Copyright © 2016 Kyle Pontius. All rights reserved.
//

import Foundation

typealias Byte = UInt8

extension Byte {
    
    // MARK: - General Methods -
    
    func byteToDecimal() -> String {
        return String(self, radix: 2)
    }
}