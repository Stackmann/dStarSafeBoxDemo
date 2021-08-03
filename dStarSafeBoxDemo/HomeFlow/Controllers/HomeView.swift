//
//  HomeView.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

protocol HomeView: BaseView {
    var openActivityFlow: (() -> Void)? { get set }
}
