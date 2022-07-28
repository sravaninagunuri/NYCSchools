//
//  SchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Sravani Nagunuri (contractor) on 7/26/22.
//

import Foundation

class SchoolDetailsViewModel {
    
    /// Fetch Schools details from backend api
    /// - Parameters:
    ///   - networkManager: network manager instance
    ///   - school: School model object
    ///   - completionHandler: completion handler with optional scores and  optional error
    func getDetails(forSelectedSchool 
        school: School,
        completionHandler: @escaping (([SATScore]?, Error?) -> Void)
    ) {
        WebService().fetchData(url: NYCSchool.getResultURL(dbn: school.dbn)) { (response: [SATScore]?, error) in
            
            if (response?.first(where: { $0.dbn == school.dbn })) != nil {
                completionHandler(response, error)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
