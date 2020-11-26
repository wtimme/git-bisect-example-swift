//
//  ViewController.swift
//  GitBisectExampleApp
//
//  Created by Wolfgang Timme on 26.11.20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Private properties
    
    @IBOutlet private var textLabel: UILabel!
    private let viewModel = ExampleViewModel()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        
        viewModel.delegate = self
    }
    
    // MARK: Private methods

    @IBAction private func didTapPrimaryActionButton() {
        viewModel.primaryAction()
    }
    
    @IBAction private func didTapSecondaryActionButton() {
        print("test")
    }
    
    @IBAction private func didTapActionBarButtonItem() {
        // TODO: Implement me.
    }

}

extension ViewController: ExampleViewModelDelegate {
    func changeTextLabelFont(to font: UIFont) {
        textLabel.font = font
    }
    
    func presentAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        
        present(alertController, animated: true)
    }
}
