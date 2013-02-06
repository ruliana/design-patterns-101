# encoding: utf-8
require 'spec_helper'

describe 'Embalador' do
  let(:cesta) { Cesta.new }
  let(:iogurte) { Produto.new(1, 'Iogurte', 12.reais, :frio) }
  let(:chocolate) { Produto.new(2, 'Chocolate', 10.reais) }
  let(:salsicha) { Produto.new(3, 'Salsicha', 6.reais, :frio) }
  let(:saco_de_salsicha) { Saquinho.new(0.5, salsicha) }

  before do
    cesta.adicionar(iogurte)
    cesta.adicionar(chocolate)
    cesta.adicionar(saco_de_salsicha)
  end

  it 'separa frios e não-frios da cesta' do
    embalador = Embalador.new
    cesta.accept(embalador)
    expect(embalador.frios).to eq([iogurte, saco_de_salsicha])
    expect(embalador.nao_frios).to eq([chocolate])
  end
end
