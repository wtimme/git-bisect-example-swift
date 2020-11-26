//
//  ExampleViewModel.swift
//  GitBisectExampleApp
//
//  Created by Wolfgang Timme on 26.11.20.
//

import Foundation
import UIKit

protocol ExampleViewModelDelegate: AnyObject {
    func changeTextLabelFont(to font: UIFont)
}

struct ExampleViewModel {
    let title: String
    
    weak var delegate: ExampleViewModelDelegate?
    
    init(title: String = "My example app") {
        self.title = title
    }
}
