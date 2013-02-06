class Cesta
  def initialize
    @produtos = []
  end

  def adicionar(produto)
    @produtos << produto
  end

  def preco
    @produtos.reduce(0.reais) { |acumulado, produto| acumulado + produto.preco }
  end

  def accept(visitor)
    @produtos.each { |produto| produto.accept(visitor) }
  end
end
