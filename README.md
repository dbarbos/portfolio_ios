# Portfolio iOS ... work in progress

O objetivo deste repositório é mostrar algumas das técnicas e conhecimentos necessários para um desenvolvedor iOS. Cada pasta do repositório possui um projeto ou um arquivo de playground demonstrando funcionamento específicos e referências para consultas no futuro.


## Lista de projetos

Nome                  | descrição                                            | categoria
--------------------- | ---------------------------------------------------- | -----------
Strong Weak Unowned   | Mostrar a diferença entre os 3 tipos de declaração   | **fundaments**
Dependency Injection  | Mostra como funciona injeção de dependencia no swift | **SOLID**
Swinject              | Injeção de dependência usando o Swinject framework   | **framework**
Coordinator           | Mostra como implementar o padrão coordinator         | **pattern**
MVVM with Unit Test     | Mostra como aplicar MVVM para facilitar teste unitário | **pattern**
RxCocoa Weather       | Um projeto que acessa a openweather API usando rxCocoa| **framework**
MVVM with Rx News App | Mostra como implementar MVVM com RxSwift e RxCocoa | **pattern**

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
   
  * Neste exemplo eu mostro como fazer a injeção de dependência usando o framework Swinject. No exemplo, é criado um container que registra um livro e o injeta em um leitor, desta forma, ao invocar a função de leitura do leitor o livro injetado é invocado e sua propriedade título é jogada no prompt.
    
  ```swift
        let container = Container()
        container.register(Livro.self) {_ in Livro(name: "The Hobbit")}
        container.register(Leitor.self) { l in
            Leitor(livro: l.resolve(Livro.self)!)
        }
        
        let diler = container.resolve(Leitor.self)!
        
        message.text = diler.ler()
  ```
   
* ### Coordinator usando Storyboard e XIB
 
  * Neste exemplo eu demonstor como fazer uma navegação usando o padrão de coordinator tanto para ir para uma tela no storyboard quanto para ir para uma tela carregada através de XIB.
  
  ```swift
     class MainCoordinator: Coordinator, StoryBoardNavigating {
        var childCoordinators = [Coordinator]()
        var navigationController: UINavigationController

        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }

        func start() {
            let vc = ViewController.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: false)
        }

        func storyBoardNavigate() {
            let vc = StoryBoardNavigateController.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }

        func xibado() {
            let vc = XibViewController()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }

    }
  ```
   
   
* ### MVVM aplicado com teste unitário
 
  * O padrão MVVM nos permite testar de forma muito mais fácil, componentes do aplicativo reduzindo a dependencia entre eles. Neste exemplo eu mostro como aplicar um target de teste unitário em um projeto com padrão MVVM aplicado.
  
  ```swift
   func testGameViewModelCantHaveMoreThan5Stars() {
        let game = Game(name: "Test Game", system: "test", rate: 7)
        let gameViewModel = GameViewModel(game: game)
        XCTAssertEqual(gameViewModel.rate, 5)
    }
    
    func testGameViewModelCantHaveLessThan0Stars() {
        let game = Game(name: "Test Game", system: "test", rate: -3)
        let gameViewModel = GameViewModel(game: game)
        XCTAssertEqual(gameViewModel.rate, 0)
    }
  ```
 
* ### RxCocoa para acessar o openweather API
 
 * Nes exemplo eu mostro um projeto usando RxCocoa para acessar a openweather API, digitando o nome da cidade no campo de texto os dados são recuperados da API e exibidos na tela de forma reativa. As extensões criadas ajudam, fornecendo um método para acessar a API diretamente de um URLRequest. Neste exeplo é possível ver : generics, RxSwift, RxCocoa, decoder, extensions, etc.
 
 
* ### MVVM com RxSwift e RxCocoa para acessar o newsapi.org
   
 * Neste exemplo eu criei um aplicativo para acessar a newsapi.org usando RxSwift com MVVM. O aplicativo traz uma lista de notícias e exibe em uma tableview. O bind da célula do artigo é feito com driver.
   
```swift
  articleViewModel.title.asDriver(onErrorJustReturn: "")
     .drive(cell.titleLabel.rx.text)
     .disposed(by: disposeBag)
```
