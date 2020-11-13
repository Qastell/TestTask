//
//  RoundedButton.swift
//  TestTask
//
//  Created by Кирилл Романенко on 12.11.2020.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
    }
    
}
