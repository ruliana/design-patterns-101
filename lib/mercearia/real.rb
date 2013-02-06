class Real

  attr_reader :centavos

  def initialize(valor)
    @centavos = (valor * 100).to_i
  end

  def ==(outro)
    outro.class == self.class && outro.centavos == @centavos
  end

  def hash
    @valor.hash
  end

  def coerce(outro)
    return self, outro
  end

  def -@
    Real.new(-@centavos / 100)
  end

  def *(numerico)
    Real.new(@centavos * numerico / 100)
  end

  def +(outro)
    Real.new((outro.centavos + @centavos) / 100)
  end

  def -(outro)
    self + (-outro)
  end

  def to_s
    inteiro = @centavos / 100
    fracao = @centavos % 100

    if inteiro >= 0
      "R$ #{inteiro},#{sprintf('%02d', fracao)}"
    else
      "(R$ #{inteiro.abs},#{sprintf('%02d', fracao)})"
    end
  end

  def inspect
    to_s + " (Real)"
  end
end

class Numeric
  def real
    Real.new(self)
  end

  def reais
    real
  end
end
