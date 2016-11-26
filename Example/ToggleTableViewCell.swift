//
//  ToggleTableViewCell.swift
//  TableViewDemo
//
//  Created by Denis Mars on 1/31/16.
//  Copyright © 2016 Martians Inc. All rights reserved.
//

import UIKit
import Static

class ToggleTableViewCell: UITableViewCell, Cell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    var row: Row!
    
    var on:Bool = true {
        didSet {
            self.toggleSwitch.isOn = self.on
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        toggleSwitch.isOn = self.on
    }
    
    @IBAction func toggleSwitchAction(_ sender: UISwitch) {
        row?.selection?(self)
    }
   
    
    // MARK: - CellType
    
    static func nib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func configure(row: Row) {
        self.row = row
        label.text = row.text
        self.on = row.context?["on"] as? Bool == true
    }
    
}
