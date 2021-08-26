//
//  HomeModuleFactory.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

protocol HomeModuleFactory {
    func makeHomeView() -> HomeView
    func makeSubCategoriesView() -> HomeView
}
