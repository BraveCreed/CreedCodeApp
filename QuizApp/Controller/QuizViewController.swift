//
//  QuizViewController.swift
//  QuizApp
//
//  Created by SHUBHAM AGARWAL on 06/03/22.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var option1Button: UIButton!

        @objc var option1: String? {
            get { return option1Button.titleLabel?.text }
            set { option1Button.setTitle(newValue, for: .normal) }
        }
    // MARK: - Properties
    let стрессВопросы = [
        // Замените вопросы и варианты ответов на вопросы о стрессе
        "Как часто вы чувствуете себя перегруженным повседневными задачами?",
        "Трудно ли вам заснуть или заснуть из-за переживаний?",
        "Как часто вы испытываете физические симптомы, такие как головные боли или боли в животе?",
        "Как хорошо вы справляетесь с неожиданными изменениями или вызовами?",
        "Вы часто чувствуете раздражение или злость, не осознавая этого?",
    ]
    let стрессОпции = [
        "Редко",
        "Иногда",
        "Часто",
        "Очень часто",
        "Всегда",
    ]
    var пользовательскиеОтветы = [Int]() // 1-5 соответствует вариантам выше

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Actions
    @IBAction func onClickSubmit(_ sender: Any) {
        // Вычислите оценку стресса на основе ответов пользователя
        var стрессОценка = 0
        for ответ in пользовательскиеОтветы {
            стрессОценка += ответ
        }

        // Перейдите на экран результатов со рассчитанной оценкой
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        vc.стрессОценка = стрессОценка
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Collection View Delegates & Datasource
extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return стрессВопросы.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell else { return QuizCollectionViewCell() }
        cell.вопросLabel.text = стрессВопросы[indexPath.row]
        for i in 0..<стрессОпции.count {
            let вариантКнопка = cell.viewWithTag(i + 1) as! UIButton
            вариантКнопка.setTitle(стрессОпции[i], for: .normal)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150) // Отрегулируйте высоту в зависимости от длины вопроса
    }
}

extension QuizViewController: QuizCollectionViewCellDelegate {
    func selectedOption(index: Int) {
        пользовательскиеОтветы.append(index + 1) // Сохраните выбранный вариант пользователя (1-5)
    }
}

// MARK: - Quiz Collection Cell (QuizCollectionViewCell.swift):

