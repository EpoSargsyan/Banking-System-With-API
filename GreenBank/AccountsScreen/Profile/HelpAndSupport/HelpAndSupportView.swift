//
//  HelpAndSupportView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class HelpAndSupportView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let helpAndSupportLabel = UILabel(text: "helpAndSupport_text".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    private let frequentlyLabel = UILabel(text: "helpAndSupport_frequently_text".localized,
                                          textColor: AppColor.accentDefault.uiColor,
                                          font: UIFont.systemFont(ofSize: 16))
    
    private let loginQuestionTF = TextField(placeholder: "", rightImage: "down")
    
    let loginQuestionBtn = UIButton()
    
    let loginAnswer = UILabel(text: "helpAndSupport_login_answer".localized,
                                textColor: AppColor.accentDefault.uiColor,
                                font: UIFont.systemFont(ofSize: 14))
    
    let transferAccountsQuestionTF = TextField(placeholder: "", rightImage: "down")
    
    let transferAccountsQuestionBtn = UIButton()
    
    let transferAccountsAnswer = UILabel(text: "helpAndSupport_transfer_accounts_answer".localized,
                                         textColor: AppColor.accentDefault.uiColor,
                                         font: UIFont.systemFont(ofSize: 14))
    
    let transferCardsQuestionTF = TextField(placeholder: "", rightImage: "down")
    
    let transferCardsQuestionBtn = UIButton()
    
    let transferCardsAnswer = UILabel(text: "helpAndSupport_transfer_cards_answer".localized,
                                     textColor: AppColor.accentDefault.uiColor,
                                     font: UIFont.systemFont(ofSize: 14))
    
    let passwordChangeQuestionTF = TextField(placeholder: "", rightImage: "down")
    
    let passwordChangeQuestionBtn = UIButton()
    
    let passwordChangeAnswer = UILabel(text: "helpAndSupport_change_password_answer".localized,
                                       textColor: AppColor.accentDefault.uiColor,
                                       font: UIFont.systemFont(ofSize: 14))
    
    private let contactUsLabel = UILabel(text: "helpAndSupport_contuctUs".localized,
                                         textColor: AppColor.accentDefault.uiColor,
                                         font: UIFont.systemFont(ofSize: 16))
    
    private let liveChatLabel = UILabel(text: "helpAndSupport_liveChat_text".localized,
                                        textColor: AppColor.accentDefault.uiColor,
                                        font: UIFont.systemFont(ofSize: 14))
    
    private let feedbackLabel = UILabel(text: "helpAndSupport_feedback_text".localized,
                                        textColor: AppColor.accentDefault.uiColor,
                                        font: UIFont.systemFont(ofSize: 14))
    
    lazy var stackView = UIStackView(arrangedSubviews: [loginQuestionTF,
                                                        transferAccountsQuestionTF,
                                                        transferCardsQuestionTF,
                                                        passwordChangeQuestionTF],
                                     axis: .vertical, spacing: 15)
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    public var flag1: Bool = true
    public var flag2: Bool = true
    public var flag3: Bool = true
    public var flag4: Bool = true
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        helpAndSupportLabel.translatesAutoresizingMaskIntoConstraints = false
        frequentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contactUsLabel.translatesAutoresizingMaskIntoConstraints = false
        liveChatLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(helpAndSupportLabel)
        contentView.addSubview(frequentlyLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(contactUsLabel)
        contentView.addSubview(liveChatLabel)
        contentView.addSubview(feedbackLabel)
        
        scrollView.backgroundColor = AppColor.cremeWhite.uiColor
        
        setupLabels()
        setupTextFields()
        setupBtns()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            helpAndSupportLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            helpAndSupportLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            frequentlyLabel.topAnchor.constraint(equalTo: helpAndSupportLabel.bottomAnchor, constant: 40),
            frequentlyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: frequentlyLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -480)
        ])
        
        NSLayoutConstraint.activate([
            contactUsLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 67),
            contactUsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            liveChatLabel.topAnchor.constraint(equalTo: contactUsLabel.bottomAnchor, constant: 16),
            liveChatLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            liveChatLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            feedbackLabel.topAnchor.constraint(equalTo: liveChatLabel.bottomAnchor, constant: 20),
            feedbackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            feedbackLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            feedbackLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120)
        ])
    }
    
    func setupTextFields() {
        loginQuestionTF.text = "helpAndSupport_login_question".localized
        transferAccountsQuestionTF.text = "helpAndSupport_transfer_accounts_question".localized
        transferCardsQuestionTF.text = "helpAndSupport_transfer_cards_question".localized
        passwordChangeQuestionTF.text = "helpAndSupport_change_password_question".localized
        
        loginQuestionTF.textColor = AppColor.accentDefault.uiColor
        transferAccountsQuestionTF.textColor = AppColor.accentDefault.uiColor
        transferCardsQuestionTF.textColor = AppColor.accentDefault.uiColor
        passwordChangeQuestionTF.textColor = AppColor.accentDefault.uiColor
    }
    
    func setupBtns() {
        loginQuestionBtn.translatesAutoresizingMaskIntoConstraints = false
        transferAccountsQuestionBtn.translatesAutoresizingMaskIntoConstraints = false
        transferCardsQuestionBtn.translatesAutoresizingMaskIntoConstraints = false
        passwordChangeQuestionBtn.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(loginQuestionBtn)
        contentView.addSubview(transferAccountsQuestionBtn)
        contentView.addSubview(transferCardsQuestionBtn)
        contentView.addSubview(passwordChangeQuestionBtn)
        
        NSLayoutConstraint.activate([
            loginQuestionBtn.topAnchor.constraint(equalTo: loginQuestionTF.topAnchor),
            loginQuestionBtn.leadingAnchor.constraint(equalTo: loginQuestionTF.leadingAnchor),
            loginQuestionBtn.trailingAnchor.constraint(equalTo: loginQuestionTF.trailingAnchor),
            loginQuestionBtn.bottomAnchor.constraint(equalTo: loginQuestionTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            transferAccountsQuestionBtn.topAnchor.constraint(equalTo: transferAccountsQuestionTF.topAnchor),
            transferAccountsQuestionBtn.leadingAnchor.constraint(equalTo: transferAccountsQuestionTF.leadingAnchor),
            transferAccountsQuestionBtn.trailingAnchor.constraint(equalTo: transferAccountsQuestionTF.trailingAnchor),
            transferAccountsQuestionBtn.bottomAnchor.constraint(equalTo: transferAccountsQuestionTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            transferCardsQuestionBtn.topAnchor.constraint(equalTo: transferCardsQuestionTF.topAnchor),
            transferCardsQuestionBtn.leadingAnchor.constraint(equalTo: transferCardsQuestionTF.leadingAnchor),
            transferCardsQuestionBtn.trailingAnchor.constraint(equalTo: transferCardsQuestionTF.trailingAnchor),
            transferCardsQuestionBtn.bottomAnchor.constraint(equalTo: transferCardsQuestionTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordChangeQuestionBtn.topAnchor.constraint(equalTo: passwordChangeQuestionTF.topAnchor),
            passwordChangeQuestionBtn.leadingAnchor.constraint(equalTo: passwordChangeQuestionTF.leadingAnchor),
            passwordChangeQuestionBtn.trailingAnchor.constraint(equalTo: passwordChangeQuestionTF.trailingAnchor),
            passwordChangeQuestionBtn.bottomAnchor.constraint(equalTo: passwordChangeQuestionTF.bottomAnchor)
        ])
        
        loginQuestionBtn.backgroundColor = .none
        transferAccountsQuestionBtn.backgroundColor = .none
        transferCardsQuestionTF.backgroundColor = .none
        passwordChangeQuestionBtn.backgroundColor = .none
    }
    
    func setupLabels() {
        loginAnswer.numberOfLines = 4
        transferAccountsAnswer.numberOfLines = 4
        transferCardsAnswer.numberOfLines = 4
        passwordChangeAnswer.numberOfLines = 4
        liveChatLabel.numberOfLines = 3
        feedbackLabel.numberOfLines = 5
    }
}
