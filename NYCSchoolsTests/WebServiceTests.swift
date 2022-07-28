//
//  WebServiceTests.swift
//  NYCSchoolsTests
//
//  Created by Sravani Nagunuri (contractor) on 7/27/22.
//

import XCTest
@testable import NYCSchools

class WebServiceTests: XCTestCase {
    
    func testNetworkFailure1() throws {

        let myurlSession = MyNYCSessionFailureProtocol(status: 400, error: NYCError.internalServerError)
        let network = WebService(urlSession: myurlSession)
        XCTAssertFalse(network.getInternetAvailability(connection: .none))
        let expectation = XCTestExpectation(description: "wait for url response")

        if let url = URL(string: "https://www.google.com") {
           network.fetchData(url: url) { (obj: [School]?, error) in
               XCTAssertNotNil(error)
               expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 1)
    }
    
    func testNetworkFailure3() throws {

        struct User: Decodable {
            var name: String
        }
        
        let myurlSession = MyNYCSessionFailureProtocol(status: 400, error: nil)
        let network = WebService(urlSession: myurlSession)
        XCTAssertFalse(network.getInternetAvailability(connection: .none))
        let expectation = XCTestExpectation(description: "wait for url response")

        if let url = URL(string: "https://www.google.com") {
           network.fetchData(url: url) { (obj: [User]?, error) in
               XCTAssertNil(error)
               expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 1)
    }

    func testNetworkFailure4() throws {

        struct User: Decodable {
            var name: String
        }

        let myurlSession = MyNYCSessionFailureProtocol(status: 200, error: nil)
        let network = WebService(urlSession: myurlSession)
        XCTAssertFalse(network.getInternetAvailability(connection: .none))
        let expectation = XCTestExpectation(description: "wait for url response")

        if let url = URL(string: "https://www.google.com") {
           network.fetchData(url: url) { (obj: [User]?, error) in
               XCTAssertNil(error)
               expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 1)
    }

}
