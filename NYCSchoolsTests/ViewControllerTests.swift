//
//  ViewControllerTests.swift
//  NYCSchoolsTests
//
//  Created by Sravani Nagunuri (contractor) on 7/27/22.
//

import XCTest
@testable import NYCSchools

class ViewControllerTests: XCTestCase {
    
    var schoolController: SchoolsListViewController?
    var detailViewController: SchoolDetailsViewController?

    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let controller = storyBoard.instantiateViewController(withIdentifier: "SchoolsViewControllerID") as? SchoolsListViewController {
            controller.loadViewIfNeeded()
            schoolController = controller
        }
    }
    
    override func tearDownWithError() throws {
        schoolController = nil
        detailViewController = nil
    }
        
    func testUtility() {
        if let schoolController = schoolController {
            XCTAssertNoThrow(Utilities.open(scheme: .mailto, urlString: "", contoller: schoolController))
            XCTAssertNoThrow(Utilities.open(scheme: .https, urlString: "www.google.com", contoller: schoolController))
        }
    }

}
