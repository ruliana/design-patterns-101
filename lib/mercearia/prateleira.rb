class Prateleira
  def initialize
    @produtos = {}
  end

  def colocar(quantidade, produto)
    @produtos[produto.codigo] = [quantidade, produto]
  end

  def quantidade(codigo_do_produto)
    quantidade, produto = @produtos[codigo_do_produto]
    quantidade || 0
  end

  def pegar(codigo_do_produto, quantidade_pedida = 1, faltantes_collecting = [])

    quantidade_disponivel, produto = @produtos[codigo_do_produto]

    unless quantidade_disponivel
      faltantes_collecting << {produto_ausente: codigo_do_produto}
      return nil
    end

    if quantidade_pedida <= quantidade_disponivel
      restante = quantidade_disponivel - quantidade_pedida
      @produtos[codigo_do_produto] = [restante, produto]
    else
      deficit = quantidade_pedida - quantidade_disponivel
      faltantes_collecting << {faltantes: deficit, produto: produto}
      @produtos.delete(codigo_do_produto)
    end

    produto
  end
end
