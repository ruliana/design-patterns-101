require 'spec_helper'

describe Saquinho do

  let(:barraco) { Produto.new(1, 'Vinho barraco', 10.reais) }
  let(:amendoin) { Produto.new(2, 'Minduim', 2.reais) }

  it 'informa o valor do produto dentro dele' do
    saquinho = Saquinho.new(1, barraco)
    expect(saquinho.preco).to eq(10.reais)

    saquinho = Saquinho.new(2, barraco)
    expect(saquinho.preco).to eq(20.reais)

    saquinho = Saquinho.new(0.5, amendoin)
    expect(saquinho.preco).to eq(1.real)
  end

  it 'arredonda o calculo' do
    saquinho = Saquinho.new(1/3.to_f, amendoin)
    expect(saquinho.preco).to eq(0.66.real)
  end
end

