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
    func presentAlert(title: String)
}

final class ExampleViewModel {
    let title: String
    
    weak var delegate: ExampleViewModelDelegate?
    
    init(title: String = "My example app") {
        self.title = title
    }
    
    func primaryAction() {
        print("Primary action")
    }
    
    func secondaryAction() {
        delegate?.presentAlert(title: "You have tapped the secondary action.")
    }
}
