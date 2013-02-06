# encoding: utf-8
require 'spec_helper'

describe Produto do
  let(:produto) { Produto.new(1, 'Vinho barroco', 10.reais) }

  it 'apresenta-se em um format legal nas strings' do
    expect("#{produto}").to eq('Produto: "Vinho barroco", código: 1, preço: R$ 10,00')
  end
end
