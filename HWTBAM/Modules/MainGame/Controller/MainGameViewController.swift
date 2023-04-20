//
//  MainGameViewController.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import UIKit
import AVFoundation

class MainGameViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timerView = TimerView()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Here will be your question"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let questionCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Гость"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let moneyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private lazy var answerAButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 1
        return button
    }()
    
    private lazy var answerBButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 2
        return button
    }()
    
    private lazy var answerCButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 3
        return button
    }()
    
    private lazy var answerDButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 4
        return button
    }()
    
    private let letterALabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 5
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 1
        return label
    }()
    
    private let letterBLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 5
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "B"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 2
        return label
    }()
    
    private let letterCLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 5
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "C"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 3
        return label
    }()
    
    private let letterDLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 5
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "D"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 4
        return label
    }()
    
    private lazy var giveMeMyMoneyButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(didTapGiveMeMyMoneyButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("Забрать деньги", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }()
    
    private lazy var promptFiftyFiftyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "fiftyFifty"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapFiftyFiftyButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promptHallHelpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "hallHelp"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapHallHelpButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promptCallToFriendButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "mistake"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapCallToFriendButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let numberCostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loginMoneyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let answersBlockStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let lettersBlockStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = -5
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let promptStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 1
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var mainGameBrain = MainGameBrain()
    var winBrain = WinBrain()
    let music = MusicModel()
    private var checkTimer = Timer()
    
    private lazy var labelArray: [UILabel] = [letterALabel,
                                              letterBLabel,
                                              letterCLabel,
                                              letterDLabel
    ]
    private lazy var buttonsArray: [UIButton] = [answerAButton,
                                                 answerBButton,
                                                 answerCButton,
                                                 answerDButton
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        updateUI()
        music.playSound(nameOfMusic: "timing")
        music.player?.numberOfLoops = 5
        timerView.timerStart()
        checkTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.checkEndTime()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        music.playSound(nameOfMusic: "timing")
        music.player?.numberOfLoops = 5
    }
    
    func setupLoginLabel(_ name: String) {
        loginLabel.text = name
    }
    
    func setupMoneyLabel(_ bablo: String) {
        moneyLabel.text = bablo
    }
    
    func checkUsedPrompts(with model: UsedPrompts) {
        if model.fiftyFifty == false {
            promptFiftyFiftyButton.isEnabled = model.fiftyFifty
            promptFiftyFiftyButton.setImage(UIImage(named: "redCrossFiftyFifty"), for: .normal)
        }
        
        if model.hallHelp == false {
            promptHallHelpButton.isEnabled = model.hallHelp
            promptHallHelpButton.setImage(UIImage(named: "redCrossHallHelp"), for: .normal)
        }
        
        if model.callToFriend == false {
            promptCallToFriendButton.isEnabled = model.callToFriend
            promptCallToFriendButton.setImage(UIImage(named: "redCrossCallToFriend"), for: .normal)
        }
    }

    func checkEndTime() {
        if !timerView.timerFlag {
            let index = mainGameBrain.questionNumber
            guard let loginName = loginLabel.text else { fatalError() }
            music.player?.stop()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.music.player?.stop()
                let viewController = WiningViewController()
                viewController.modalPresentationStyle = .fullScreen
                viewController.setupLoginName(loginName)
                viewController.playerAnswer = PlayerAnswer(question: self?.mainGameBrain.safeMoney(index).safeNumber ?? Int(), result: true)
                viewController.setupSafeMoney(with: self?.mainGameBrain.safeMoney(index) ?? LoseViewModel(safeNumber: Int(), safeMoney: String()))
                viewController.setupCheckedAnswer(isChecked: false)
                
                self?.present(viewController, animated: false)
            }
            checkTimer.invalidate()
        }
    }
    
    @objc
    private func didTapAnswerButton(_ sender: UIButton) {
        let userAnswer = sender.tag
        let userGotItRight = mainGameBrain.checkAnswer(userAnswer: String(userAnswer))
        let index = mainGameBrain.questionNumber
        guard let loginName = loginLabel.text else { fatalError() }
        
        music.playSound(nameOfMusic: "acceptedAnswer")
        
        Thread.sleep(forTimeInterval: 5)
        
        if userGotItRight {
            LogicMeneger.shared.rightMakeMistake = false
            sender.backgroundColor = UIColor.green
            mainGameBrain.forEachArray(labelArray, sender.tag, .green)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                
                let viewController = WiningViewController()
                viewController.setIndex(self?.mainGameBrain.numberArray[index] ?? Int())
                viewController.playerAnswer = PlayerAnswer(question: self?.mainGameBrain.questionNumberArray[index] ?? Int(), result: true)
                viewController.setupCheckedAnswer(isChecked: true)
                viewController.setupPrompts(with: self?.mainGameBrain.usedPrompts ?? UsedPrompts())
                viewController.setupLoginName(loginName)
                self?.music.player?.stop()
                viewController.modalPresentationStyle = .fullScreen
                
                self?.present(viewController, animated: false)
            }
            
        } else if LogicMeneger.shared.rightMakeMistake {
            LogicMeneger.shared.rightMakeMistake = false
            
            sender.backgroundColor = UIColor.orange
            mainGameBrain.forEachArray(labelArray, sender.tag, .orange)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                
                let viewController = WiningViewController()
                viewController.setupLoginName(loginName)
                viewController.setIndex(self?.mainGameBrain.numberArray[index] ?? Int())
                viewController.playerAnswer = PlayerAnswer(question: self?.mainGameBrain.questionNumberArray[index] ?? Int(), result: true)
                viewController.setupCheckedAnswer(isChecked: true)
                viewController.setupPrompts(with: self?.mainGameBrain.usedPrompts ?? UsedPrompts())
                self?.music.player?.stop()
                viewController.modalPresentationStyle = .fullScreen
                
                self?.present(viewController, animated: false)
            }
        } else {
            sender.backgroundColor = UIColor.red
            mainGameBrain.forEachArray(labelArray, sender.tag, .red)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.music.player?.stop()
                let viewController = WiningViewController()
                viewController.modalPresentationStyle = .fullScreen
                viewController.playerAnswer = PlayerAnswer(question: self?.mainGameBrain.safeMoney(index).safeNumber ?? Int(), result: true)
                viewController.setupSafeMoney(with: self?.mainGameBrain.safeMoney(index) ?? LoseViewModel(safeNumber: Int(), safeMoney: String()))
                viewController.setupLoginName(loginName)
                viewController.setupCheckedAnswer(isChecked: false)
                
                self?.present(viewController, animated: false)
            }
        }
    }
    
    @objc
    private func didTapFiftyFiftyButton(_ sender: UIButton) {
        mainGameBrain.promptFifryFifry(buttonsArray)
        mainGameBrain.disableButton(sender, "redCrossFiftyFifty")
        mainGameBrain.setfiftyFifty(false)
        music.player?.pause()
        music.playSound(nameOfMusic: "50-50")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.music.playSound(nameOfMusic: "timingAfter")
            self.music.player?.numberOfLoops = 5
        }
    }
    
    @objc
    private func didTapHallHelpButton(_ sender: UIButton) {
        mainGameBrain.hallHelpValues()
        guard let hallHelp = mainGameBrain.hallHelp else { fatalError() }
        mainGameBrain.disableButton(sender, "redCrossHallHelp")
        mainGameBrain.setHallHelp(false)
        music.player?.pause()
        music.playSound(nameOfMusic: "Hint Chosen")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.music.playSound(nameOfMusic: "timingAfter")
            self.music.player?.numberOfLoops = 5
        }
        
        let viewController = HallHelpViewController()
        viewController.setupHallHelp(with: hallHelp)
        present(viewController, animated: false)
    }
    
    @objc
    private func didTapCallToFriendButton(_ sender: UIButton) {
        mainGameBrain.callToFriend()
        music.player?.pause()
        music.playSound(nameOfMusic: "Hint Chosen")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.music.playSound(nameOfMusic: "timingAfter")
            self.music.player?.numberOfLoops = 5
        }
        mainGameBrain.setCallToFriend(false)
        mainGameBrain.disableButton(sender, "redCrossCallToFriend")
    }
    
    @objc
    private func didTapGiveMeMyMoneyButton() {
        music.player?.stop()
        guard let prizeMoney = moneyLabel.text else { fatalError() }
        guard let loginName = loginLabel.text else { fatalError() }
        let viewController = ResultViewController()
        viewController.setupResultViewController(ResultModel(name: loginName, prizeMoney: prizeMoney))
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
}

private extension MainGameViewController {
    func updateUI() {
        questionCostLabel.text = "\(mainGameBrain.changeCostText()) руб."
        questionNumberLabel.text = mainGameBrain.changeNumberText()
        questionLabel.text = mainGameBrain.getQuestionText()
        letterALabel.backgroundColor = UIColor.blue
        letterBLabel.backgroundColor = UIColor.blue
        letterCLabel.backgroundColor = UIColor.blue
        letterDLabel.backgroundColor = UIColor.blue
        answerAButton.backgroundColor = UIColor.blue
        answerAButton.setTitle(mainGameBrain.getButtonTitle(with: 0), for: .normal)
        answerBButton.backgroundColor = UIColor.blue
        answerBButton.setTitle(mainGameBrain.getButtonTitle(with: 1), for: .normal)
        answerCButton.backgroundColor = UIColor.blue
        answerCButton.setTitle(mainGameBrain.getButtonTitle(with: 2), for: .normal)
        answerDButton.backgroundColor = UIColor.blue
        answerDButton.setTitle(mainGameBrain.getButtonTitle(with: 3), for: .normal)
    }
    
    func setupViewController() {
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        numberCostStackView.addArrangedSubview(questionNumberLabel)
        numberCostStackView.addArrangedSubview(questionCostLabel)
        loginMoneyStackView.addArrangedSubview(loginLabel)
        loginMoneyStackView.addArrangedSubview(moneyLabel)
        answersBlockStackView.addArrangedSubview(answerAButton)
        answersBlockStackView.addArrangedSubview(answerBButton)
        answersBlockStackView.addArrangedSubview(answerCButton)
        answersBlockStackView.addArrangedSubview(answerDButton)
        lettersBlockStackView.addArrangedSubview(letterALabel)
        lettersBlockStackView.addArrangedSubview(letterBLabel)
        lettersBlockStackView.addArrangedSubview(letterCLabel)
        lettersBlockStackView.addArrangedSubview(letterDLabel)
        centerStackView.addArrangedSubview(lettersBlockStackView)
        centerStackView.addArrangedSubview(answersBlockStackView)
        promptStackView.addArrangedSubview(promptFiftyFiftyButton)
        promptStackView.addArrangedSubview(promptHallHelpButton)
        promptStackView.addArrangedSubview(promptCallToFriendButton)
        mainStackView.addArrangedSubview(timerView)
        mainStackView.addArrangedSubview(numberCostStackView)
        mainStackView.addArrangedSubview(questionLabel)
        mainStackView.addArrangedSubview(centerStackView)
        mainStackView.addArrangedSubview(promptStackView)
        mainStackView.addArrangedSubview(loginMoneyStackView)
        
        view.addSubview(mainStackView)
        view.addSubview(giveMeMyMoneyButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            timerView.widthAnchor.constraint(equalToConstant: 100),
            timerView.heightAnchor.constraint(equalToConstant: 100),
            timerView.bottomAnchor.constraint(equalTo: numberCostStackView.topAnchor, constant: 0),
            
            numberCostStackView.heightAnchor.constraint(equalToConstant: 30),
            numberCostStackView.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -10),
            
            questionLabel.bottomAnchor.constraint(equalTo: centerStackView.topAnchor, constant: -10),
            
            lettersBlockStackView.widthAnchor.constraint(equalToConstant: 40),
            
            centerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            centerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            centerStackView.heightAnchor.constraint(equalToConstant: 210),
            centerStackView.bottomAnchor.constraint(equalTo: giveMeMyMoneyButton.topAnchor, constant: -10),
            giveMeMyMoneyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            giveMeMyMoneyButton.heightAnchor.constraint(equalToConstant: 50),
            giveMeMyMoneyButton.widthAnchor.constraint(equalToConstant: 200),
            giveMeMyMoneyButton.bottomAnchor.constraint(equalTo: promptStackView.topAnchor, constant: -10),
            
            promptStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            promptStackView.heightAnchor.constraint(equalToConstant: 81),
            promptStackView.bottomAnchor.constraint(equalTo: loginMoneyStackView.topAnchor, constant: -10),
            loginMoneyStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        ])
    }
}

