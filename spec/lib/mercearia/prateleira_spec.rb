# encoding: utf-8
require 'spec_helper'

describe Prateleira do
  let (:barroco) { Produto.new(1, 'Vinho barroco', 10.reais) }
  let (:barato) { Produto.new(2, 'Vinho barato', 2.reais) }
  let (:prateleira) { Prateleira.new }

  before do
    prateleira.colocar(1, barroco)
    prateleira.colocar(5, barato)
  end

  it 'fornece produtos pelo código' do
    expect(prateleira.pegar(1).nome).to eq('Vinho barroco')
    expect(prateleira.pegar(2).nome).to eq('Vinho barato')
  end

  it 'informa quantidade de um produto' do
    expect(prateleira.quantidade(1)).to eq(1)
    expect(prateleira.quantidade(2)).to eq(5)
  end

  it 'diminui a quantidade do produto pego' do
    prateleira.pegar(2, 4)
    expect(prateleira.quantidade(2)).to eq(1)
    prateleira.pegar(2, 4)
    expect(prateleira.quantidade(2)).to eq(0)
  end

  it 'informa faltantes ao pegar um produto' do
    faltantes = []
    prateleira.pegar(1, 10, faltantes)
    expect(faltantes.first).to eq({faltantes: 9, produto: barroco})
  end

  it 'retorna vazio (nil) se não houver produto' do
    expect(prateleira.pegar(999)).to be_nil
  end

  it 'informa produto ausente se não estiver na prateleira' do
    faltantes = []
    prateleira.pegar(999, 1, faltantes)
    expect(faltantes.first).to eq({produto_ausente: 999})
  end
end
