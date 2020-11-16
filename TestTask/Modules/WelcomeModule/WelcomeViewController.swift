//
//  WelcomeViewController.swift
//  TestTask
//
//  Created by Кирилл Романенко on 12.11.2020.
//

import UIKit

class WelcomeViewController: RoutableViewController<WelcomeViewPresenterProtocol> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadViews()
    }
    
    //MARK: - Methods
    
    @objc private func startAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.flash(0.4)
            sender.flash(1)
        } completion: { complete in
            self.presenter.signIn()
        }
    }
    
    private func loadViews() {
        view.backgroundColor = .yellowTest
        navigationController?.navigationBar.isHidden = true
        
        createWhiteLine()
        createBlueCircle()
        createFirstWhiteStar()
        createSecondWhiteStar()
        createPinkStar()
        createYellowCircle()
        createLogoLabel()
        createStartButton()
        createSignInButton()
    }
    
    //MARK: - Creating views
    
    private var blueCircleView: CircleView = {
        let circleView = CircleView()
        circleView.backgroundColor = .blueTest
        return circleView
    }()
    
    private var yellowCircleView: CircleView = {
        let circleView = CircleView()
        circleView.backgroundColor = .yellowTest
        return circleView
    }()
    
    private var whiteLineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.whiteLine
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Logo"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private var firstWhiteStarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.whiteStar
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var secondWhiteStarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.whiteStar
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var pinkStarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.pinkStar
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var startButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = .white
        btn.setTitle("Начнем!", for: .normal)
        btn.setTitleColor(.darkGrayFont, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    private var signInButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = .yellowTest
        btn.setTitle("У меня уже есть аккаунт!", for: .normal)
        btn.setTitleColor(.grayFont, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
}

//MARK: - WelcomeViewProtocol

extension WelcomeViewController: WelcomeViewProtocol {
    
    //MARK: - Constraints
    
    private func createStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -154)
        ].forEach{ $0.isActive = true }
        
        startButton.layoutSubviews()
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
    
    private func createSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            signInButton.topAnchor.constraint(equalTo: startButton.bottomAnchor)
        ].forEach{ $0.isActive = true }
        
        signInButton.layoutSubviews()
        signInButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
    
    private func createBlueCircle() {
        view.addSubview(blueCircleView)
        blueCircleView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            blueCircleView.widthAnchor.constraint(equalToConstant: 287),
            blueCircleView.heightAnchor.constraint(equalTo: blueCircleView.widthAnchor),
            blueCircleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -163.5),
            blueCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 253)
        ].forEach{ $0.isActive = true }
        
        blueCircleView.layoutSubviews()
    }
    
    private func createYellowCircle() {
        view.addSubview(yellowCircleView)
        yellowCircleView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            yellowCircleView.widthAnchor.constraint(equalToConstant: 99),
            yellowCircleView.heightAnchor.constraint(equalTo: yellowCircleView.widthAnchor),
            yellowCircleView.centerYAnchor.constraint(equalTo: blueCircleView.centerYAnchor),
            yellowCircleView.centerXAnchor.constraint(equalTo: blueCircleView.centerXAnchor)
        ].forEach{ $0.isActive = true }
        
        yellowCircleView.layoutSubviews()
    }
    
    private func createWhiteLine() {
        view.addSubview(whiteLineImageView)
        whiteLineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            whiteLineImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 23),
            whiteLineImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.5),
            whiteLineImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createLogoLabel() {
        view.addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5)
        ].forEach{ $0.isActive = true }
    }
    
    private func createFirstWhiteStar() {
        view.addSubview(firstWhiteStarView)
        firstWhiteStarView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            firstWhiteStarView.widthAnchor.constraint(equalToConstant: 40),
            firstWhiteStarView.heightAnchor.constraint(equalTo: firstWhiteStarView.widthAnchor),
            firstWhiteStarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
            firstWhiteStarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 427)
        ].forEach{ $0.isActive = true }
    }
    
    private func createSecondWhiteStar() {
        view.addSubview(secondWhiteStarView)
        secondWhiteStarView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            secondWhiteStarView.widthAnchor.constraint(equalToConstant: 40),
            secondWhiteStarView.heightAnchor.constraint(equalTo: secondWhiteStarView.widthAnchor),
            secondWhiteStarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 284),
            secondWhiteStarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 483)
        ].forEach{ $0.isActive = true }
    }
    
    private func createPinkStar() {
        view.addSubview(pinkStarView)
        pinkStarView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            pinkStarView.widthAnchor.constraint(equalToConstant: 101),
            pinkStarView.heightAnchor.constraint(equalTo: pinkStarView.widthAnchor),
            pinkStarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 185),
            pinkStarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 429)
        ].forEach{ $0.isActive = true }
    }
    
}

