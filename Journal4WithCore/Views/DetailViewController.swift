//
//  DetailViewController.swift
//  Journal4WithCore
//
//  Created by tyson ericksen on 11/14/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    var detailLandingPad: Entry? {
        didSet {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let entryTitle = textField.text, let entryText = textView.text else { return }
        
        if let entry = detailLandingPad {
            EntryController.sharedInstance.updateEntry(entry: entry, entryTitle: entryTitle, entryText: entryText)
        } else {
            let entry = EntryController.sharedInstance.addEntry(entryTitle: entryTitle, entryText: entryText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateView() {
        loadViewIfNeeded()
        guard let entry = detailLandingPad else { return }
        textField.text = entry.entryTitle
        textView.text = entry.entryText
    }
}
