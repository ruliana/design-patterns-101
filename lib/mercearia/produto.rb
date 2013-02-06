# encoding: utf-8
class Produto

  attr_reader :codigo, :nome, :preco

  def initialize(codigo, nome, preco, tipo = :normal)
    @codigo, @nome, @preco, @tipo = codigo, nome, preco, tipo
  end

  def frio?
    @tipo == :frio
  end

  def accept(visitor)
    visitor.visit(self)
  end

  def to_s
    %(Produto: "#{@nome}", código: #{@codigo}, preço: #{@preco})
  end

  def inspect
    to_s
  end
end
