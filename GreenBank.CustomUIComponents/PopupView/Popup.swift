//
//  PopupView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 02.02.24.
//

import UIKit

final public class Popup: UIView {
    public func setupUI() {
        self.backgroundColor = AppColor.textLightGrey.uiColor
        self.layer.cornerRadius = 3
    }
}
