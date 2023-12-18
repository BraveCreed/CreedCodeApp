//
//  QuizCollectionViewCell.swift
//  QuizApp
//
//  Created by SHUBHAM AGARWAL on 06/03/22.
//

import UIKit

protocol QuizCollectionViewCellDelegate: AnyObject {
    func selectedOption(index: Int)
}

class QuizCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var вопросLabel: UILabel!
    @IBOutlet weak var вариант1Button: UIButton!
    @IBOutlet weak var вариант2Button: UIButton!
    @IBOutlet weak var вариант3Button: UIButton!
    @IBOutlet weak var вариант4Button: UIButton!
    @IBOutlet weak var вариант5Button: UIButton!

    // MARK: - Delegate
    weak var delegate: QuizCollectionViewCellDelegate?

    // MARK: - Actions
    @IBAction func onClickOption1(_ sender: Any) {
        delegate?.selectedOption(index: 0)
    }

    @IBAction func onClickOption2(_ sender: Any) {
        delegate?.selectedOption(index: 1)
    }

    @IBAction func onClickOption3(_ sender: Any) {
        delegate?.selectedOption(index: 2)
    }

    @IBAction func onClickOption4(_ sender: Any) {
        delegate?.selectedOption(index: 3)
    }

    @IBAction func onClickOption5(_ sender: Any) {
        delegate?.selectedOption(index: 4)
    }
}
