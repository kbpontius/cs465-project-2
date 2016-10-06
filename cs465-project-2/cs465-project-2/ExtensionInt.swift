//
//  ExtensionInt.swift
//  cs465-project-2
//
//  Created by Kyle Pontius on 10/6/16.
//  Copyright © 2016 Kyle Pontius. All rights reserved.
//

import Foundation

extension Int {
    var toBinaryString: String { return String(self, radix: 2) }
    var toHexaString:   String { return String(self, radix: 16) }
}
