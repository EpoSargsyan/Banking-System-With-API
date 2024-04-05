//
//  BaseViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 31.01.24.
//

import UIKit
import GreenBank_ViewModel

public class BaseViewController<T: IViewModel>: UIViewController {
    public var viewModel: T?
}
