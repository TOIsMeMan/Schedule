//
//  CollectionViewCell.swift
//  schedule
//
//  Created by MacBook Pro on 01/07/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var timeFinishLabel: UILabel!
    @IBOutlet weak var nameOfTaskLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func renderTask(name: String, timeStart: String, timeFinish: String) {
        backgroundColor = .red
        backgroundColorView.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        self.nameOfTaskLabel.isHidden = false
        self.timeStartLabel.isHidden = false
        self.timeFinishLabel.isHidden = false
        
        self.nameOfTaskLabel.text = name
        self.timeStartLabel.text = timeStart
        self.timeFinishLabel.text = timeFinish
    }
    
    func renderFreeTime() {
        backgroundColor = .green
        backgroundColorView.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        self.nameOfTaskLabel.isHidden = true
        self.timeStartLabel.isHidden = true
        self.timeFinishLabel.isHidden = true
    }
    
    func highlightCell() {
        backgroundColorView.layer.borderWidth = 1
    }

    func unHighlightCell() {
        backgroundColorView.layer.borderWidth = 0
    }
}
