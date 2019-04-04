//
//  ViewController.swift
//  Practice
//
//  Created by Diler Barbosa on 03/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import UIKit
import Swinject

protocol SendNameDelegate: class {
    func fullName(first: String, last: String) -> String
}

class ViewController: UIViewController {
    
    weak var delegate: SendNameDelegate?
    
    @IBOutlet weak var message: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let container = Container()
        container.register(Livro.self) {_ in Livro(name: "The Hobbit")}
        container.register(Leitor.self) { l in
            Leitor(livro: l.resolve(Livro.self)!)
        }
        
        let diler = container.resolve(Leitor.self)!
        
        message.text = diler.ler()
        
    }


}


class Leitor {
    let livro: Livro
    
    init(livro: Livro) {
        self.livro = livro
    }
    
    func ler () -> String {
        return "Estou lendo \(livro.name)."
    }
}

class Livro {
    let name: String
    init(name: String) {
        self.name = name
    }
}



