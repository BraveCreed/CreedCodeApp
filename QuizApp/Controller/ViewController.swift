//
//  ViewController.swift
//  QuizApp
//
//  Created by SHUBHAM AGARWAL on 04/03/22.
//

import UIKit

@objc class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var topicButton: UIButton!
    @IBOutlet weak var playButton: UIButton! {
        didSet {
            playButton.layer.cornerRadius = playButton.frame.height / 2
        }
    }

    // MARK: - Actions
    @IBAction func onClickPlay(_ sender: Any) {
        // Перейдите на экран теста
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

