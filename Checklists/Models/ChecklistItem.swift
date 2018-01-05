//
//  ChecklistItem.swift
//  Checklists
//
//  Created by nguyen.phuc.khanh on 1/5/18.
//  Copyright © 2018 khanh.nguyen. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
    override init() {
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
}
