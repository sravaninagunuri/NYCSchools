//
//  SchoolsListViewModel.swift
//  NYCSchools
//
//  Created by Sravani Nagunuri (contractor) on 7/25/22.
//

import Foundation

class SchoolsListViewModel {
    
    //MARK: - private properties
    var schools: [School]? = [School]()
    var filteredSchools: [School]? = [School]()
    
    
    /// Get list of Schools
    /// - Parameters:
    ///   - networkManager: network manager object
    ///   - completionHandler: completion handler to be passed which contain optional error
    func fetchSchoolsListData(
        completionHandler: @escaping (Error?) -> Void
    ) {
        WebService().fetchData(url: NYCSchool.schoolDirectoryURL) { [weak self] (response: [School]?, error) in
            
            self?.schools = response
            self?.filteredSchools = self?.schools?
                .sorted(by:
                            { firstSchool, secondSchoool in
                    return firstSchool.schoolName ?? "" < secondSchoool.schoolName ?? ""
                }
                )
            completionHandler(error)
        }
    }
    
    /// Filter school list with given search text
    /// - Parameter searchText: String
    ///  filter the schools list with given string
    func filterSchools(searchText: String) {
        filteredSchools = searchText.isEmpty ?
        schools :
        schools?.filter { school in
            return school.schoolName?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
    }
}
