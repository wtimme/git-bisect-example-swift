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
    func openWebView(url: URL)
}

final class ExampleViewModel {
    let title: String
    
    weak var delegate: ExampleViewModelDelegate?
    
    private var currentTextStyle: UIFont.TextStyle = .body
    
    init(title: String = "My example app") {
        self.title = title
    }
    
    func primaryAction() {
        let allTextStyles: [UIFont.TextStyle] = [
            .body,
            .callout,
            .caption1,
            .caption2,
            .footnote,
            .subheadline,
        ]
        
        guard let indexOfCurrentTextStyle = allTextStyles.firstIndex(of: currentTextStyle) else { return }
        
        let indexOfNextTextStyle: Int
        if indexOfCurrentTextStyle + 1 == allTextStyles.count {
            // This is the last text style in the list; start from the top.
            indexOfNextTextStyle = 0
        } else {
            indexOfNextTextStyle = indexOfCurrentTextStyle + 1
        }
        
        let nextTextStyle = allTextStyles[indexOfNextTextStyle]
        
        // Remember the text style.
        self.currentTextStyle = nextTextStyle
        
        // Ask the delegate to update the label.
        delegate?.changeTextLabelFont(to: UIFont.preferredFont(forTextStyle: nextTextStyle))
    }
    
    func secondaryAction() {
        delegate?.presentAlert(title: "You have tapped the secondary action.")
    }
}
