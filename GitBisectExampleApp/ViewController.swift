//
//  ViewController.swift
//  GitBisectExampleApp
//
//  Created by Wolfgang Timme on 26.11.20.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = ExampleViewModel()

    @IBAction private func didTapPrimaryActionButton() {
        print("Primary button tapped")
    }
    
    @IBAction private func didTapSecondaryActionButton() {
        print("Secondary button tapped")
    }

}

