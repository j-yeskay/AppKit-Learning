//
//  ViewController.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit

let maxX = NSScreen.main!.frame.maxX
let maxY = NSScreen.main!.frame.maxY


public class ViewController : NSViewController{
    public override func loadView() {
        view = MainView(frame: NSRect(x: 0, y: 0, width: maxX, height:  maxY))
        
        let rightNavbarView = RightNavbarView()

        let googleLogoView = GoogleLogoView()
        
        view.addSubview(rightNavbarView)
        view.addSubview(googleLogoView)
        
        let searchBar = SearchBar()
        
        let searchBarBackground = SearchBackground()
        
        let searchIcon = SearchIcon()
        
        let footer = Footer()

        view.addSubview(searchBarBackground)
        view.addSubview(searchBar)
        view.addSubview(searchIcon)
//        view.addSubview(footer)
//        view.layer?.backgroundColor = NSColor.black.cgColor
        
        NSLayoutConstraint.activate([
        
            rightNavbarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            rightNavbarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            rightNavbarView.views.last!.heightAnchor.constraint(equalToConstant: 30),
            rightNavbarView.views.last!.widthAnchor.constraint(equalToConstant: 96),
            
            googleLogoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            googleLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleLogoView.heightAnchor.constraint(equalToConstant: 108),
            googleLogoView.widthAnchor.constraint(equalToConstant: 280),

            searchBarBackground.widthAnchor.constraint(equalToConstant: 587),
            searchBarBackground.heightAnchor.constraint(equalToConstant: 47),
            searchBarBackground.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 10),
            searchBarBackground.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: 10),
            searchBarBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBarBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBar.widthAnchor.constraint(equalToConstant: 500),
            searchBar.heightAnchor.constraint(equalToConstant: 22),
            
            searchIcon.leftAnchor.constraint(equalTo: searchBarBackground.leftAnchor, constant: 10),
            searchIcon.heightAnchor.constraint(equalToConstant: 15),
            searchIcon.widthAnchor.constraint(equalToConstant: 15),
            searchIcon.bottomAnchor.constraint(equalTo: searchBarBackground.bottomAnchor, constant: -15),

        ])
        
    }

}
