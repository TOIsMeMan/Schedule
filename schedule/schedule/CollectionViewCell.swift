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
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func renderTask(timeStart: String, timeFinish: String) {
        backgroundColor = .red
        
        self.timeStartLabel.text = timeStart
        debugPrint(self.timeStartLabel.text)
        self.timeFinishLabel.text = timeFinish
        debugPrint(self.timeFinishLabel.text)
    }
    
    func renderFreeTime() {
        backgroundColor = .green
        self.timeStartLabel.isHidden = true
        self.timeFinishLabel.isHidden = true
    }

}
