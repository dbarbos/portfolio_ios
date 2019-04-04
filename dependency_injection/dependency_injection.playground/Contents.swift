import UIKit

class Organizador {
    
    func adicionarTodosOsItens(da caixa: Caixa, naPrateleira : Prateleira) {
        let todosOsItens = caixa.getAll()
        naPrateleira.estante.append(contentsOf: todosOsItens)
    }
    
}

class Prateleira {
    var estante : Array<Livro> = []
}


class Caixa {
    
    private var caixa: Array<Livro> = []
    
    init (itens: Array<Livro>) {
        caixa.append(contentsOf: itens)
    }
    
    func getAll() -> Array<Livro> {
        return caixa
    }
}

class Livro {
    let name : String
    init(name: String) {
        self.name = name
    }
}


let lotr = Livro(name: "The Lord of the Rings")
let hobb = Livro(name: "The Hobbit")

let caixa = Caixa(itens: [lotr,hobb])

let ficcao = Prateleira()

let james = Organizador()

james.adicionarTodosOsItens(da: caixa, naPrateleira: ficcao) // o organizador cuida de combinar as informações da caixa e da prateleira através de uma injeção de dependencia.

print(ficcao.estante.map { $0.name })


// Injeção de dependencia:

// Constructor injection

class Dono {
    let nome: String
    private let pet: Pet
    
    init (nome: String, pet: Pet) {
        self.nome = nome
        self.pet = pet // pet é injetado ( Constructor injection )
    }
    
    func acariciar() {
        self.pet.bark()
    }
}

class Pet {
    let nome: String
    init (nome: String) { self.nome = nome }
    func bark() -> String {
        return "au"
    }
}

// Property Injection

class Notificacao {
    var service : Service?
    func promocao() {
        if service != nil {
            service?.sendMessage() // propriedade é injetada ( Property Injection )
        }
    }
}

class Service {
    func sendMessage() { print("promoção")}
}

