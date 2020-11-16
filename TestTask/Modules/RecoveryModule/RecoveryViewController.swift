//
//  RecoveryViewController.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation
import UIKit

class RecoveryViewController: RoutableViewController<RecoveryViewPresenterProtocol> {
    
    var linkWasPost = false

    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadViews()
    }
    
    //MARK: - Methods
    
    @objc private func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func validateEmail() {
        if let email = emailTextField.text?.trimmingCharacters(in: .whitespaces) {
            if presenter.isValid(email) {
                linkButton.isEnabled = true
                linkButton.alpha = 1
            } else {
                linkButton.isEnabled = false
                linkButton.alpha = 0.4
            }
        }
    }
    
    @objc private func linkAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.flash(0.4)
            sender.flash(1)
        } completion: { complete in
            self.linkButtonAction()
        }
    }
    
    func linkButtonAction() {
        if linkWasPost {
            dismiss(animated: true, completion: { self.linkWasPost = false })
        } else {
            linkWasPost = true
            loginLabel.text = "Спасибо!"
            instructionLabel.text = "Ссылка была отправлена на вашу почту, проверьте входящие сообщения."
            emailTextField.alpha = 0
            emailTextField.isEnabled = false
            
            [
                linkButton.heightAnchor.constraint(equalToConstant: 60),
                linkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
                linkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
                linkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 243)
            ].forEach{ $0.isActive = true }
            
            linkButton.setTitle("Войти", for: .normal)
            
            linkButton.layoutSubviews()
        }
    }
    
    private func loadViews() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        createYellowLine()
        createEmailTextField()
        createLoginButton()
        createBackButton()
        createLoginLabel()
        createInstructionLabel()
    }
    
    //MARK: - Creation views
    
    private var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Logo"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Не можете войти?"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, введите адрес электронной почты для получения ссылки на восстановление пароля."
        label.textColor = #colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.4078431373, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var yellowLineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.yellowLine
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Адрес электронной почты"
        textField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grayTest.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private var linkButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = .blueTest
        btn.isEnabled = false
        btn.alpha = 0.4
        btn.setTitle("Отправить ссылку", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    private var backButton: RoundedButton = {
        let btn = RoundedButton()
        btn.setImage(Image.back, for: .normal)
//        btn.conte
        return btn
    }()
}

//MARK: - LoginViewProtocol

extension RecoveryViewController: RecoveryViewProtocol {
    
    //MARK: - Constraints
    
    private func createEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 243)
        ].forEach{ $0.isActive = true }
        
        emailTextField.layoutSubviews()
        emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
        emailTextField.delegate = self
    }
    
    private func createLoginButton() {
        view.addSubview(linkButton)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            linkButton.heightAnchor.constraint(equalToConstant: 60),
            linkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            linkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            linkButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ].forEach{ $0.isActive = true }
        
        linkButton.layoutSubviews()
        linkButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
    }
    
    private func createYellowLine() {
        view.addSubview(yellowLineImageView)
        yellowLineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            yellowLineImageView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowLineImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            yellowLineImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            loginLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -60),
            loginLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            backButton.widthAnchor.constraint(equalToConstant: 32),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5)
        ].forEach{ $0.isActive = true }
        
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private func createInstructionLabel() {
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            instructionLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            instructionLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            instructionLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ].forEach{ $0.isActive = true }
    }
}

extension RecoveryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
