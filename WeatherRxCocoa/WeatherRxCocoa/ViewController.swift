//
//  ViewController.swift
//  WeatherRxCocoa
//
//  Created by Diler Barbosa on 07/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeDaCidadeTextField: UITextField!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var humidadeLabel: UILabel!
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nomeDaCidadeTextField.rx.value
            .subscribe(onNext: { [weak self] cidade in
                
                if let cidade = cidade {
                    if cidade.isEmpty {
                        self?.displayWeather(nil)
                    } else {
                        self?.fetchWeather(by: cidade)
                    }
                }
                
                
            }).disposed(by: disposeBag)
        
    }
    
    private func fetchWeather(by cidade: String) {
        guard let cidadeEncoded = cidade.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL.urlForWeatherAPI(cidade: cidadeEncoded) else {
                return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        URLRequest.load(resource: resource)
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn(WeatherResult.empty)
            .subscribe(onNext: { result in
                let weather = result.main
                self.displayWeather(weather)
            }).disposed(by: disposeBag)
        
    }
    
    private func displayWeather(_ weather: Weather?) {
        
        if let weather = weather {
            self.temperaturaLabel.text = "\(weather.temp) F"
            self.humidadeLabel.text = "\(weather.humidity) H"
        } else {
            self.temperaturaLabel.text = "Oops"
            self.humidadeLabel.text =  "Oops"
        }
        
    }


}

