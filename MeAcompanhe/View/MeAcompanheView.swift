//
//  MeAcompanheView.swift
//  MeAcompanhe
//
//  Created by Jean Ramalho on 13/03/25.
//
import Foundation
import UIKit
import MapKit

class MeAcompanheView: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Me Acompanhe"
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        return label
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    lazy var mainInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 18
        return stackView
    }()
    
    lazy var velocityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var latiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var longiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var latiLongiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var addressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var velocityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Velocidade"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var latiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Latitude:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var longiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Longitude:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Endereço:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var latiInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    lazy var longiInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    lazy var addressInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rua Silvia de Faria Marcondes, 445, Parque Fernanda"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    lazy var velocityNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        return view
    }()
    
    lazy var numberVelocityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7.32"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(headerView)
        headerView.addSubview(headerTitleLabel)
        
        addSubview(infoView)
        infoView.addSubview(mainInfoStackView)
        
        mainInfoStackView.addArrangedSubview(velocityStackView)
        mainInfoStackView.addArrangedSubview(infoStackView)
        
        velocityStackView.addArrangedSubview(velocityLabel)
        velocityStackView.addArrangedSubview(velocityNumberView)
        velocityNumberView.addSubview(numberVelocityLabel)
        
        infoStackView.addArrangedSubview(latiLongiStackView)
        infoStackView.addArrangedSubview(addressStackView)
        
        latiLongiStackView.addArrangedSubview(latiStackView)
        latiLongiStackView.addArrangedSubview(longiStackView)
        
        latiStackView.addArrangedSubview(latiLabel)
        latiStackView.addArrangedSubview(latiInfoLabel)
        
        longiStackView.addArrangedSubview(longiLabel)
        longiStackView.addArrangedSubview(longiInfoLabel)
        
        addressStackView.addArrangedSubview(addressLabel)
        addressStackView.addArrangedSubview(addressInfoLabel)
        
        addSubview(mapView)
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),
            headerTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
            
            infoView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainInfoStackView.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 12),
            mainInfoStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            mainInfoStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            mainInfoStackView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -12),
            
            velocityStackView.topAnchor.constraint(equalTo: mainInfoStackView.topAnchor),
            velocityStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 18),
            velocityStackView.bottomAnchor.constraint(equalTo: mainInfoStackView.bottomAnchor),
            
            velocityLabel.topAnchor.constraint(equalTo: velocityStackView.topAnchor, constant: 18),
            velocityLabel.centerXAnchor.constraint(equalTo: velocityStackView.centerXAnchor),
            
            velocityNumberView.topAnchor.constraint(equalTo: velocityLabel.bottomAnchor, constant: 12),
            velocityNumberView.centerXAnchor.constraint(equalTo: velocityStackView.centerXAnchor),
            velocityNumberView.bottomAnchor.constraint(equalTo: velocityStackView.bottomAnchor, constant: -18),
            velocityNumberView.heightAnchor.constraint(equalToConstant: 150),
            velocityNumberView.widthAnchor.constraint(equalToConstant: 150),
            
            numberVelocityLabel.centerXAnchor.constraint(equalTo: velocityNumberView.centerXAnchor),
            numberVelocityLabel.centerYAnchor.constraint(equalTo: velocityNumberView.centerYAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: mainInfoStackView.topAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -18),

            
            mapView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
