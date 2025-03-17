//
//  MeAcompanhe.swift
//  MeAcompanhe
//
//  Created by Jean Ramalho on 13/03/25.
//
import Foundation
import UIKit
import MapKit

class MeAcompanheViewController: UIViewController {
    
    let contentView: MeAcompanheView = MeAcompanheView()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        
    }
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension MeAcompanheViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    private func setupLocation(){
        
    }
}
