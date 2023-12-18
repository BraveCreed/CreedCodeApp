//
//  ResultViewController.swift
//  QuizApp
//
//  Created by SHUBHAM AGARWAL on 06/03/22.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - Properties
    var стрессОценка: Int = 0
    var стресУровень: Int {
        return стрессОценка / 5
    }

    // MARK: - Outlets
    @IBOutlet weak var stressScoreLabel: UILabel!
    @IBOutlet weak var стресУровеньLabel: UILabel!
    @IBOutlet weak var stressTipsLabel: UILabel!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Отобразите оценку стресса
        stressScoreLabel.text = "Ваша оценка стресса: \(стрессОценка)"

        // Определите уровень стресса
        стресУровеньLabel.text = "Уровень стресса: \(стресУровень)"

        // Отобразите советы по управлению стрессом
        stressTipsLabel.text = """
        Вот несколько советов по управлению стрессом:

        * Высыпайтесь
        * Занимайтесь спортом
        * Питайтесь здоровой пищей
        * Избегайте алкоголя и курения
        * Проводите время с близкими людьми
        * Найдите время для себя
        """
    }
}
