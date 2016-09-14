//
//  HashAttack.swift
//  cs465-project-2
//
//  Created by Kyle Pontius on 9/13/16.
//  Copyright © 2016 Kyle Pontius. All rights reserved.
//

import Foundation

class HashAttack {
    
    // MARK: - Properties -
    
    init() {
        
    }
    
    // MARK: - Internal Methods -
    
    func execute() {
        let message = "Hello world!"
        let sha1 = message.sha1().hexToByte()
        print("SHA-1 Message: \(sha1)")
    }
}