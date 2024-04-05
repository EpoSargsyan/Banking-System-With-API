//
//  DatePickerView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 13.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class DatePickerView: UIView {
    let popUpView = Popup()
    
    let datePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    let selectButton = UIButton(backgroundColor: AppColor.primaryHover.uiColor, title: "signup_select_btn".localized)
    
    func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        //text color
        datePicker.setValue(AppColor.textDarkGrey.uiColor, forKey: "textColor")
        //dividers
        datePicker.backgroundColor = AppColor.cremeWhite.uiColor
        datePicker.setValue(true, forKey: "highlightsToday")
    }
    
    func setupUI() {
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(popUpView)
        self.addSubview(datePicker)
        self.addSubview(selectButton)
        
        popUpView.setupUI()
        setupDatePicker()
        
        NSLayoutConstraint.activate([
            popUpView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            popUpView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popUpView.widthAnchor.constraint(equalToConstant: 139),
            popUpView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: 44),
            datePicker.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 48),
            datePicker.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -48),
        ])
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 24),
            selectButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: 48),
            selectButton.widthAnchor.constraint(equalToConstant: 176)
        ])
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
}
