# Portfolio iOS

O objetivo deste repositório é mostrar algumas das técnicas e conhecimentos necessários para um desenvolvedor iOS. Cada pasta do repositório possui um projeto ou um arquivo de playground demonstrando funcionamento específicos e referências para consultas no futuro.


## Lista de projetos

Nome                  | descrição                                            | categoria
--------------------- | ---------------------------------------------------- | -----------
Strong Weak Unowned   | Mostrar a diferença entre os 3 tipos de declaração   | **fundaments**
Dependency Injection  | Mostra como funciona injeção de dependencia no swift | **SOLID**
Swinject              | Injeção de dependência usando o Swinject framework   | **framework**
Coordinator           | Mostra como implementar o padrão coordinator         | **pattern**
MVVM with Unit Test     | Mostra como aplicar MVVM para facilitar teste unitário | **pattern**

## Detalhamento dos projetos

* ### Strong Weak Unowned AKA ciclo de retenção

  * Neste arquivo de playground, são criados 3 tipos de cartão de crédito com referência ao cliente. 
  
  
  ```swift
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
  ```
  
  Com isso, sobrescrevo a instancia original e mostro como se comparta cada tipo de cartão e a sua referencia. No caso do strong é criada uma cópia, no caso do weak a referencia é perdida e o valor se torna nulo, mas não é desalocado da memória, e a referência unowned quando perdida é desalocada da memória, e se não for tratada gera um SIGABRT error.
  
  ```swift
  let amex = CartaoStrong(cliente: clienteStrong) // Cartao com referencia strong
  let visa = CartaoWeak(cliente: clienteWeak) // Cartao com referencia weak
  let master = CartaoUnowned(cliente: clienteUnowned)
  ```
  
  * ### Dependency Injection
  
   * Neste projeto eu demonstro como é feita a injeção de dependência no swift. Mostro um exemplo de injeção onde um organizador consegue mover objetos de um lado para o outro sem que as pontas se conheçam. Depois mostor o básico da implementação da injeção no construtor e a injeção de propriedade.
   
   ```swift
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
   
   ```
 A injeção de propriedade permite passar a lógica de um método para outro objeto para que ele a execute mesmo sem saber os detalhes da execução:
 
  ```swift
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
  ```
  
  
   * ### Swinject framework
   
   
   * ### Coordinator usando Storyboard e XIB
   
   * ### MVVM aplicado com teste unitário
   
