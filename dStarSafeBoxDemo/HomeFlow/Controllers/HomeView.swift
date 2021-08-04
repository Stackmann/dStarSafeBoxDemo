//
//  HomeView.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

protocol HomeView: class, BaseView {
    var openActivityFlow: (() -> Void)? { get set }
}
