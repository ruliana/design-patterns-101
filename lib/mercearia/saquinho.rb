class Saquinho
  def initialize(quantidade, produto)
    @quantidade, @produto = quantidade, produto
  end

  def preco
     @produto.preco * @quantidade
  end

  def frio?
    @produto.frio?
  end

  def accept(visitor)
    visitor.visit(self)
  end
end
