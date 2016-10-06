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
    
    var messageSet = Set<String>()
    var resultSet = Set<String>()
    var results = [Double]()
    var currentIndex = 0
    
    // MARK: - Test Constants
    
    let bitMatchingLength = 10
    
    init() { }
    
    // MARK: - API Methods -
    
    func execute() {
        for _ in 0 ..< 500 {
            generateTestRun()
        }
        
        printTestResults()
    }
    
    // MARK: - Internal Methods -
    
    fileprivate func generateTestRun() {
        while true {
            let matchFound = generateSHA1Message(bitLength: bitMatchingLength)
            
            if matchFound {
                resetForNewTest()
                break
            }
            
            currentIndex += 1
            print("Current Index: \(currentIndex)")
        }
    }
    
    fileprivate func generateSHA1Message(bitLength: Int) -> Bool {
        let message = generateRandomString()
        guard !messageSet.contains(message) else {
            return false
        }
        
        let sha1 = message.sha1()
        let binaryString = sha1.convertHexToBinaryString()
        let truncatedString = binaryString.truncate(bitLength: bitLength)
        
        guard !resultSet.contains(truncatedString) else { return true }
    
        resultSet.insert(truncatedString)
//        print("SHA-1 Message: \(sha1)")
//        print("Binary Version: \(binaryString)")
//        print("Truncated String: \(truncatedString)")
        
        return false
    }
    
    // MARK: - Helper Methods -
    
    fileprivate func average(input: [Double]) -> Double {
        return input.reduce(0) { $0 + $1/Double(input.count) }
    }
    
    fileprivate func printTestResults() {
        printSeperatorLine()
        print("Bit Matching Length: \(bitMatchingLength)")
        print("Average # of Attempts: \(average(input: results))")
        printSeperatorLine()
    }
    
    fileprivate func printSeperatorLine() {
        print("------------------------------------------------")
    }
    
    fileprivate func generateRandomString() -> String {
        let uuid = NSUUID().uuidString
        print(uuid)
        return uuid
    }
    
    fileprivate func resetForNewTest() {
        results.append(Double(currentIndex))
        currentIndex = 0
        resultSet.removeAll()
        messageSet.removeAll()
    }
    
    // MARK: - Test Methods -
    
    func testHex() {
        let ff = "44"
        let binaryString = ff.hexaToBinaryString
        print("String: \(binaryString)")
    }
}
