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
        setupLocation()
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
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let mapView = contentView.mapView
        mapView.showsUserLocation = true
        guard let userLocation = locations.last else {return}
        
        let latitude: CLLocationDegrees = userLocation.coordinate.latitude
        let longitude: CLLocationDegrees = userLocation.coordinate.longitude
        let velocidade = userLocation.speed
        
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
        
        mapView.setRegion(region, animated: true)
        
        contentView.latiInfoLabel.text = String(latitude)
        contentView.longiInfoLabel.text = String(longitude)
        contentView.numberVelocityLabel.text = String(velocidade)
        
        // Recupera endereço do usuário atraves da localizacao de latitude e longitude
        CLGeocoder().reverseGeocodeLocation(userLocation) { localDetails, erro in
            
            if erro == nil {
                if let local = localDetails?.first {
                    let rua = local.thoroughfare ?? ""
                    let numero = "n° \(local.subThoroughfare ?? "sem número")"
                    let bairro = local.subLocality ?? ""
                    let cidade = local.locality ?? ""
                    let estado = local.administrativeArea ?? ""
                    let pais = local.country ?? ""
                    
                    
                    let endereco: String = "\(rua), \(numero), \(bairro) - \(cidade) - \(estado) | \(pais)"
                    
                    self.contentView.addressInfoLabel.text = endereco
                    
                }
                
            } else {
                self.contentView.addressInfoLabel.text = "Não foi possível recuperar endereço do usuário."
                print(erro as Any)
            }
            
        }
    }
    
    // Trata permisões para quando o usuário não permitir acesso a localizaçao
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        
//        if status != .authorizedWhenInUse {
//            
//            let alertController = UIAlertController(title: "Permissão de Localização",
//                                                    message: "É necessária a permissão de localização para que o app funcione corretamente, por favor autorize a localização!", preferredStyle: .alert)
//            
//            let setupActions = UIAlertAction(title: "Abrir Configurações", style: .default) { (setupActions) in
//                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString) {
//                    UIApplication.shared.open(configuracoes as URL)
//                }
//            }
//            let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
//
//            alertController.addAction(setupActions)
//            alertController.addAction(cancelAction)
//            
//            present(alertController, animated: true, completion: nil)
//        }
//    }
    
    
}
