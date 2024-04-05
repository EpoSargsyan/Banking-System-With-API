//
//  HomePageViewLoadingState.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 16.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import SkeletonView

class LoadingHomePageView: UIView {
    let gradient = SkeletonGradient(baseColor: UIColor(hex: "#CFEEBE").withAlphaComponent(0.5),
                                    secondaryColor: UIColor(hex: "#D9E9E8").withAlphaComponent(0.1))
    
    let card = UIImageView(image: UIImage(named: "CardSkeleton"))
    
    let label = UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let tabBar = UIImageView(image: UIImage(named: "TabBarSkeleton"))
    
    let button = UIImageView(image: UIImage(named: "ButtonSkeleton"))
    
    let vieW = UIView()
    
    let label1 = UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let label2 = UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let line =  UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let label3 = UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let label4 =  UIImageView(image: UIImage(named: "FieldSkeleton"))
    
    let button1 = UIImageView(image: UIImage(named: "MiniButtonSkeleton"))
    
    let button2 = UIImageView(image: UIImage(named: "MiniButtonSkeleton"))
    
    let navigation = UIImageView(image: UIImage(named: "NavigationSkeleton"))
    
    func setup() {
        cardConstraints()
        labelConstraints()
        tabBarConstrraints()
        viewConstraints()
        buttonConstraints()
        navigationConstraints()
        setupvieW()
        loading()
    }
    
    func navigationConstraints() {
        self.addSubview(navigation)
        navigation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
            navigation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navigation.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    func loading() {
        card.isSkeletonable = true
        tabBar.isSkeletonable = true
        label.isSkeletonable = true
        button.isSkeletonable = true
        label1.isSkeletonable = true
        label2.isSkeletonable = true
        label3.isSkeletonable = true
        label4.isSkeletonable = true
        button1.isSkeletonable = true
        button2.isSkeletonable = true
        
        card.skeletonCornerRadius = 30
        tabBar.skeletonCornerRadius = 20
        label.skeletonCornerRadius = 10
        button.skeletonCornerRadius = 24
        label1.skeletonCornerRadius = 10
        label2.skeletonCornerRadius = 10
        label3.skeletonCornerRadius = 10
        label4.skeletonCornerRadius = 10
        button1.skeletonCornerRadius = 10
        button2.skeletonCornerRadius = 10
        
        card.showAnimatedGradientSkeleton(usingGradient: gradient)
        tabBar.showAnimatedGradientSkeleton(usingGradient: gradient)
        label.showAnimatedGradientSkeleton(usingGradient: gradient)
        button.showAnimatedGradientSkeleton(usingGradient: gradient)
        label1.showAnimatedGradientSkeleton(usingGradient: gradient)
        label2.showAnimatedGradientSkeleton(usingGradient: gradient)
        label3.showAnimatedGradientSkeleton(usingGradient: gradient)
        label4.showAnimatedGradientSkeleton(usingGradient: gradient)
        button1.showAnimatedGradientSkeleton(usingGradient: gradient)
        button2.showAnimatedGradientSkeleton(usingGradient: gradient)
    }
    
    func cardConstraints() {
        self.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -38),
            card.heightAnchor.constraint(equalToConstant: 184),
        ])
    }
    
    func labelConstraints() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.widthAnchor.constraint(equalToConstant: 108),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func tabBarConstrraints() {
        self.addSubview(tabBar)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBar.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            tabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tabBar.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func buttonConstraints() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: vieW.bottomAnchor, constant: 140),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 175)
        ])
    }
    
    func viewConstraints() {
        self.addSubview(vieW)
        vieW.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vieW.topAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 16),
            vieW.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            vieW.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            vieW.heightAnchor.constraint(equalToConstant: 158)
        ])
        
        vieW.backgroundColor = AppColor.cremeWhite.uiColor // for darkmode
        
        vieW.layer.borderColor = AppColor.primaryDisable.uiColor.cgColor
        vieW.layer.borderWidth = 1
        vieW.layer.cornerRadius = 13
    }
    
    func setupvieW() {
        vieW.addSubview(label1)
        vieW.addSubview(label2)
        vieW.addSubview(label3)
        vieW.addSubview(label4)
        vieW.addSubview(line)
        vieW.addSubview(button1)
        vieW.addSubview(button2)
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label4.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: vieW.topAnchor, constant: 16),
            label1.leadingAnchor.constraint(equalTo: vieW.leadingAnchor, constant: 16),
            label1.widthAnchor.constraint(equalToConstant: 129),
            label1.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            label2.leadingAnchor.constraint(equalTo: label1.leadingAnchor),
            label2.widthAnchor.constraint(equalToConstant: 137),
            label2.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: 326),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.centerYAnchor.constraint(equalTo: vieW.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: vieW.leadingAnchor, constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            label3.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 16),
            label3.leadingAnchor.constraint(equalTo: label1.leadingAnchor),
            label3.widthAnchor.constraint(equalToConstant: 129),
            label3.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 3),
            label4.leadingAnchor.constraint(equalTo: label2.leadingAnchor),
            label4.widthAnchor.constraint(equalToConstant: 137),
            label4.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            button1.centerYAnchor.constraint(equalTo: label2.centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: 20),
            button1.widthAnchor.constraint(equalToConstant: 73),
            button1.trailingAnchor.constraint(equalTo: vieW.trailingAnchor, constant: -45)
            
        ])
        
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: label4.centerYAnchor),
            button2.heightAnchor.constraint(equalToConstant: 20),
            button2.widthAnchor.constraint(equalToConstant: 73),
            button2.trailingAnchor.constraint(equalTo: vieW.trailingAnchor, constant: -45)
        ])
    }
}
