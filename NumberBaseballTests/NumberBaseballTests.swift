//
//  NumberBaseballTests.swift
//  NumberBaseballTests
//
//  Created by 최혜선 on 25/05/2019.
//  Copyright © 2019 jamie. All rights reserved.
//

/**
 TEST
 Input
 - 0은 들어갈 수 없다
    - error
 - 각 자리는 중복될 수 없다
 - 숫자는 3자리까지 (연속적인 숫자)
 
 Logic
 - 랜덤하게 맞춰야 하는 숫자를 생성한다 (Input 조건과 동일)
 - 2 Input이 들어오면 같은 숫자가 있는 지 검사한다
 - 3 같은 자리에 같은 숫자가 있는 지 검사한다
 
 Output
 - 2 - 3 해서 ball, strike를 출력한다
 
 */

import XCTest

public class Number {
    func generateNumber() -> String {
        var numbers: String = ""
        while true {
            let number = "\(makeRandomNumber())"
            if numbers.contains(number) {
                continue
            }
            numbers += number
            
            if checkLength(numbers) {
                break
            }
        }
        return numbers
    }
    
    func checkLength(_ numbers: String) -> Bool {
        return numbers.count == 3
    }
    
    func checkContainsZero(_ numbers: String) -> Bool {
        return numbers.contains("0")
    }
    
    func makeRandomNumber() -> Int {
        return Int.random(in: 1...9)
    }
    
    func isDuplicated(_ number: String) -> Bool {
        return Set(number).count != number.count
    }
}

class NumberBaseballTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberLength() {
        let numbers = Number()
        XCTAssertTrue(numbers.checkLength(numbers.generateNumber()))
    }
    
    func testNumberContainsZero() {
        let numbers = Number()
        XCTAssertFalse(numbers.checkContainsZero(numbers.generateNumber()))
    }
    
    func testDuplicateNumber() {
        let numbers = Number()
        XCTAssertFalse(numbers.isDuplicated(numbers.generateNumber()))
    }
}
