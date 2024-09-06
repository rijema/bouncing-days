# blocky

Um Joginho feito em Flutter

Se você está vindo pelo Campus Party, e quer o projeto final, no dia 07/09, veja-o [aqui](https://github.com/allansrc/block_buster).
Se não, confira o projeto terminado na branch `feat/complete` 

## Entendendo o código :)

```dart
velocity: Vector2(
  (rand.nextDouble() - 0.5) * width, height * 0.2
).normalized()
..scale(height / 4)
```

Esse código define a propriedade `velocity` do objeto como um vetor que sua direção é aleatória no eixo X e fixa no eixo Y, com a magnitude ajustada para ser proporcional a um quarto da altura da tela (`..scale(height / 4)`). 
Essa velocidade é inicialmente normalizada para garantir que sua direção seja bem definida, e depois é escalada para controlar a velocidade real com que o objeto se move.

O resultado é um objeto que se move em uma direção aleatória, mas com uma velocidade controlada, proporcional à altura do jogo.

___

`Set<Vector2> intersectionPoints`: um conjunto de pontos onde ocorre a interseção entre os dois componentes. Cada Vector2 representa as coordenadas (x, y) de onde a colisão aconteceu.
PositionComponent other: o outro componente com o qual houve a colisão.

---

`if (intersectionPoints.first.y <= 0)`: Se a colisão ocorreu no topo do Da áera jogável (ou seja, o valor de y do ponto de colisão é menor ou igual a 0), a velocidade no eixo Y é invertida. Isso cria um efeito de "rebote" vertical. 

rebote: `velocity.y = -velocity.y;`
__

`else if (intersectionPoints.first.x <= 0)`: Se a colisão ocorre no lado esquerdo da área jogável (ou seja, x <= 0), a velocidade no eixo X é invertida, criando um rebote horizontal.

rebote: `velocity.x = -velocity.x;`
__

`else if (intersectionPoints.first.x >= game.width)`: Se a colisão ocorreu no lado direito (ou seja, x maior ou igual à largura da área de jogo), também inverte a velocidade no eixo X.

rebote: `velocity.x = -velocity.x;`
__

`else if (intersectionPoints.first.y >= game.height)`: Se a colisão ocorreu na parte inferior da área jogável (ou seja, y maior ou igual à altura da área de jogo).

acaba o game e a bola passa.

---