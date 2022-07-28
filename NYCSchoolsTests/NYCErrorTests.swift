//
//  NYCErrorTests.swift
//  NYCSchoolsTests
//
//  Created by Sravani Nagunuri (contractor) on 7/27/22.
//

import XCTest
@testable import NYCSchools

class NYCErrorTests: XCTestCase {
    
    func testError() throws {
        let error1 = NYCError.internalServerError
        XCTAssertEqual("Internal server error.", error1.localizedDescription)
        let error2 = NYCError.noInternetConnection
        XCTAssertEqual("Not connected to Internet.", error2.localizedDescription)
        let error3 = NYCError.timeout
        XCTAssertEqual("Request timed out.", error3.localizedDescription)
        let error4 = NYCError.other(statusCode: 400, response: nil)
        XCTAssertEqual("Error occured. Please try agiain!", error4.localizedDescription)

    }
}
