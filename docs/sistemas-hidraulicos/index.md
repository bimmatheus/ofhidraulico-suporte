---
hide:
  - toc
---

# Sistemas hidráulicos

A janela onde você **calcula, valida, edita e exporta** todos os sistemas
hidráulicos do projeto. É o "centro nervoso" do OFHidraulico — depois que você
configura peças e modela a rede, é aqui que tudo acontece.

## Artigos

<div class="grid cards" markdown>

-   :material-sitemap:{ .lg .middle } __[Gerenciador de sistemas](gerenciador-de-sistemas.md)__

    A janela completa: 4 áreas, 6 grupos de comandos por sistema (edição,
    automações, análise, cálculos, exportar, configurações), 9 tipos de aviso
    com vídeo dedicado.

</div>

## Em preparação

- *Editar sistemas — fontes, destinos e elementos adicionais (passo-a-passo dedicado)*
- *Sistemas dependentes (água quente alimentada por bomba de água fria)*
- *Ajustar caminhos permitidos — bloqueando trechos para bomba reserva*
- *Limpando sistemas não utilizados (CleanUnusedPipingSystems)*
- *Unindo sistemas (JoinSystems)*
- *Removendo elementos / sistemas*

## Antes de usar o Gerenciador

Para que os sistemas apareçam corretamente:

- [ ] [**Configurações → Sistemas**](../primeiros-passos/configuracoes-gerais.md#aba-sistemas)
      vincula sistemas do Revit aos sistemas do plugin
- [ ] [**Equipment Manager**](../catalogo-e-pecas/gerenciador-de-pecas.md) tem
      peças com pesos, vazões e diâmetros mínimos
- [ ] Rede no Revit tem **fontes** (reservatórios, bombas) e **destinos**
      (peças de utilização)

## Fluxo típico

1. **Modelar** a rede no Revit com tubos e peças
2. Abrir **Gerenciador de sistemas**
3. **Editar sistema** — confirmar fontes e destinos
4. **Configurações do sistema** — método de Vazão e Perda de Carga
5. **Calcular fluxo e pressão**
6. **Verificar avisos** — resolver críticos e altos
7. **Mostrar detalhes de pressão** — inspecionar memória de cálculo
8. **Exportar para Excel** — anexar ao caderno técnico
