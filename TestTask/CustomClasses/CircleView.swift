//
//  CircleView.swift
//  TestTask
//
//  Created by Кирилл Романенко on 12.11.2020.
//

import Foundation
import UIKit

class CircleView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width/2
        layer.masksToBounds = true
    }

}
