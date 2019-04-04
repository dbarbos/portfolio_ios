import UIKit

let erro = "oops não achei o cliente"

class Cliente {
    let nome: String
    var cartaoStrong: CartaoStrong?
    init (nome: String) {
        self.nome = nome
    }
}

class CartaoStrong {
    var cliente: Cliente? // referencia strong (gera uma cópia da instancia)
    init (cliente: Cliente) { self.cliente = cliente }
}

class CartaoWeak {
    weak var cliente: Cliente? // referencia weak (gera um link opcional para a instancia)
    init (cliente: Cliente) { self.cliente = cliente }
}

class CartaoUnowned {
    unowned var cliente: Cliente? // referencia weak (gera um link opcional para a instancia)
    init (cliente: Cliente) { self.cliente = cliente }
}

var clienteStrong = Cliente(nome: "diler")
var clienteWeak = Cliente(nome: "gabriel")
var clienteUnowned = Cliente(nome: "veronica")

let amex = CartaoStrong(cliente: clienteStrong) // Cartao com referencia strong
let visa = CartaoWeak(cliente: clienteWeak) // Cartao com referencia weak
let master = CartaoUnowned(cliente: clienteUnowned)

print(amex.cliente?.nome ?? erro)   // mostra a instancia do cliente no cartão strong
clienteStrong = Cliente(nome: "james") // quando a referencia original é perdida ...
print(amex.cliente?.nome ?? erro) // a instancia do cartão strong não é perdida, e o seu nome é acessado pois a referencia funciona como uma cópia do original


print(visa.cliente?.nome ?? erro)   // mostra o "link" do cliente no cartao weak
clienteWeak = Cliente(nome: "james") // quando a referencia original é perdida ...
print(visa.cliente?.nome ?? erro) // como a referencia original não existe mais, a referencia será null e o print mostrará a msg de erro.


print(master.cliente?.nome ?? erro) //mostra o link da referencia original no cartao unowned
clienteUnowned = Cliente(nome: "james") // quando a referencia original é perdida ...
//print(master.cliente?.nome ?? erro) // quando a instancia original é perdida a referencia também é desalocada da memória e se não for tratada gera um SIGABRT error.
