//
//  HomeView.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//
import UIKit

protocol HomeView: class, BaseView {
    var openActivityFlow: (() -> Void)? { get set }
    var onCategoryTap: ((ItemsViewPresenter?, IndexPath) -> Void)? { get set }
    var viewPresenter: ItemsViewPresenter? { get set }
}
