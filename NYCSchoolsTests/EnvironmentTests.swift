//
//  NYCSchoolTests.swift
//  NYCSchoolsTests
//
//  Created by Sravani Nagunuri (contractor) on 7/27/22.
//

import XCTest
@testable import NYCSchools

class NYCSchoolTests: XCTestCase {

    func testNYCSchool() {
        XCTAssertEqual(NYCSchool.baseURL.absoluteString, "https://data.cityofnewyork.us")
        XCTAssertEqual(NYCSchool.rootURLstring, NYCSchool.baseURL.absoluteString)
        XCTAssertEqual(NYCSchool.schoolDirectoryURL.path, "/resource/s3k6-pzi2.json")
        XCTAssertEqual(NYCSchool.getResultURL(dbn: "123").path, "/resource/f9bf-2cp4.json")
    }
}
