//
//  ViewController.swift
//  GitBisectExampleApp
//
//  Created by Wolfgang Timme on 26.11.20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Private properties
    
    private let viewModel = ExampleViewModel()
    
    // MARK: Private methods

    @IBAction private func didTapPrimaryActionButton() {
        print("Primary button tapped")
    }
    
    @IBAction private func didTapSecondaryActionButton() {
        print("Secondary button tapped")
    }

}

