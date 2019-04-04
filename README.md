# Portfolio iOS

O objetivo deste repositório é mostrar algumas das técnicas e conhecimentos necessários para um desenvolvedor iOS. Cada pasta do repositório possui um projeto ou um arquivo de playground demonstrando funcionamento específicos e referências para consultas no futuro.


## Lista de projetos

Nome                  | descrição                                            | tipo
--------------------- | ---------------------------------------------------- | -----------
Strong Weak Unowned   | Mostrar a diferença entre os 3 tipos de declaração   | **Playground**
Content Cell          | Content Cell                                         |


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
  ``
  
