//
//  SegmentViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class PageSimplePageWithInsetsVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Image
        let image = DSImageVM(named: "glasses", height: .absolute(250))
        
        // Compose text
        let composer = DSTextComposer()
        let spacing = appearance.interItemSpacing
        composer.add(type: .headlineWithSize(40), text: "Discover your best fashion glasses", spacing: spacing, maximumLineHeight: 38)
        composer.add(type: .subheadline, text: "Get all brands at one place. Fill the bag\nwith full joy", spacing: spacing)
        composer.add(type: .headline, text: "Only ")
        composer.add(price: DSPrice(amount: "99.0", regularAmount: "129.00", currency: "$"), size: .extraLarge, newLine: false)
        
        // Space
        let space = DSSpaceVM()
        
        // Page with view models
        var page = DSPageVM(viewModels: [image, space, composer.textViewModel()])
        page.contentInsets = appearance.margins.edgeInsets
        var pageControl = DSPageControlVM(type: .pages([page]))
        pageControl.height = .absolute(UIDevice.current.contentAreaHeigh - 80)
        
        // Show page
        self.show(content: pageControl.list().zeroLeftRightInset())
        
        // Demo end
    }
}

extension PageSimplePageWithInsetsVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Page"
    }
    
    var documentSubtitle: String {
        "With insets"
    }
    
    var documentCode: String {
        """
        // Image
        let image = DSImageVM(named: "glasses", height: .absolute(250))
        
        // Compose text
        let composer = DSTextComposer()
        let spacing = appearance.interItemSpacing
        composer.add(type: .headlineWithSize(40), text: "Discover your best fashion glasses", spacing: spacing, maximumLineHeight: 38)
        composer.add(type: .subheadline, text: "Get all brands at one place. Fill the bag\nwith full joy", spacing: spacing)
        composer.add(type: .headline, text: "Only ")
        composer.add(price: DSPrice(amount: "99.0", regularAmount: "129.00", currency: "$"), size: .extraLarge, newLine: false)
        
        // Space
        let space = DSSpaceVM()
        
        // Page with view models
        var page = DSPageVM(viewModels: [image, space, composer.textViewModel()])
        page.contentInsets = appearance.margins.edgeInsets
        var pageControl = DSPageControlVM(type: .pages([page]))
        pageControl.height = .absolute(UIDevice.current.contentAreaHeigh - 80)
        
        // Show page
        self.show(content: pageControl.list().zeroLeftRightInset())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
