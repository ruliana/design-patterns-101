# encoding: utf-8
describe Real do
  it 'é igual a outro real de mesmo valor' do
    expect(Real.new(1)).to eq(Real.new(1))
  end

  it 'contrói reais a partir de valores numéricos' do
    expect(1.real).to eq(Real.new(1))
  end

  it 'arredonda para baixo nas contas fracionadas' do
    expect(1.real * 0.333).to eq(0.33.real)
    expect(0.333 * 1.real).to eq(0.33.real)
  end

  it 'soma reais' do
    expect(1.real + 2.reais).to eq(3.reais)
  end

  it 'subtrai reais' do
    expect(2.reais - 1.real).to eq(1.real)
  end

  it 'inverte-se ao usar o sinal de negativo' do
    um_real = 1.real
    expect(-um_real).to eq(-1.real)
  end


  it 'exibe o formato R$ 0,00 nos textos' do
    expect("#{1.real}").to eq("R$ 1,00")
    expect("#{0.33.real}").to eq("R$ 0,33")
    expect("#{-1.real}").to eq("(R$ 1,00)")
  end
end
