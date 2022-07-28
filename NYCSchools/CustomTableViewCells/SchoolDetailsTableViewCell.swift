//
//  SchoolDetailsTableViewCell.swift
//  NYCSchools
//
//  Created by Sravani Nagunuri (contractor) on 7/25/22.
//

import Foundation
import UIKit

protocol SchoolDetailsDelegate: AnyObject {
    func handleUrl(scheme: ShareScheema, url: String?)
}

class SchoolDetailsTableViewCell: UITableViewCell {
    
    //MARK: - private outlets
    
    @IBOutlet weak private var schoolName: UILabel!
    @IBOutlet weak private var schoolcity: UILabel!
    @IBOutlet weak private var customView: UIView!
    
    
    /// Display School name and city
    func configureSchoolData(school: School) {
        self.schoolName?.text = school.schoolName
        self.schoolcity?.text = school.city
        
        self.customView.layer.cornerRadius = 7.0
        self.customView.layer.borderColor = UIColor.white.cgColor
        self.customView.layer.borderWidth = 3.0
    }
}
