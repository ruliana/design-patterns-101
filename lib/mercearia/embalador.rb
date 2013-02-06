class Embalador
  attr_reader :frios, :nao_frios

  def initialize
    @frios = []
    @nao_frios = []
  end

  def visit(produto)
    if produto.frio?
      @frios << produto
    else
      @nao_frios << produto
    end
  end
end
