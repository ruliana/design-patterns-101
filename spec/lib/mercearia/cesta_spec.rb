require 'spec_helper'

describe Cesta do
  let (:barroco) {Produto.new(1, 'Vinho barroco', 10.reais)}
  let (:barato) {Produto.new(2, 'Vinho barato', 2.reais)}

  it 'informa o valor total dos produtos' do
    cesta = Cesta.new
    cesta.adicionar(barroco)
    expect(cesta.preco).to eq(10.reais)

    cesta.adicionar(barato)
    expect(cesta.preco).to eq(12.reais)

    cesta.adicionar(barato)
    expect(cesta.preco).to eq(14.reais)
  end
end
