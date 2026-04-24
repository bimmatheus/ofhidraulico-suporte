---
hide:
  - toc
---

# Catálogo e peças

Tudo o que o OFHidraulico precisa saber sobre as **peças hidrossanitárias** que você vai usar
no projeto: pesos de consumo, vazões, perdas de carga, diâmetros mínimos e equivalências.

Sem um catálogo configurado, o plugin não consegue dimensionar tubulação, calcular pressão
nem gerar relatórios — então essa é a **segunda parada** depois das Configurações gerais.

## O que é um "Catálogo" no OFHidraulico

O OFHidraulico organiza tudo que aparece no projeto Revit hidráulico em quatro **categorias
nativas do Revit** que ele monitora:

<div class="grid cards" markdown>

-   :material-shower-head:{ .lg .middle } __Peças hidráulicas__

    *Plumbing Fixtures* — torneiras, chuveiros, vasos sanitários, lavatórios, máquinas de lavar.
    São os **pontos de utilização**: têm fixture units, vazão mínima e altura de instalação.

-   :material-pipe-disconnected:{ .lg .middle } __Conexões__

    *Pipe Fittings* — joelhos, tês, cruzetas, reduções, luvas. Têm **comprimentos equivalentes**
    por diâmetro, usados na perda de carga distribuída.

-   :material-valve:{ .lg .middle } __Acessórios__

    *Pipe Accessories* — registros, válvulas de retenção, hidrômetros, filtros. Têm
    **perdas localizadas** específicas.

-   :material-pump:{ .lg .middle } __Equipamentos__

    *Mechanical Equipment* — bombas, reservatórios, caixas d'água, aquecedores. Cada um com
    propriedades próprias (vazão, pressão, altura).

</div>

## Hierarquia de organização

Dentro do gerenciador, peças são organizadas em **quatro níveis** para facilitar a navegação:

```
Categoria   (ex: "Conexões")
  └── Grupo   (ex: "Tês")
        └── Modelo   (ex: "Tê 90° PVC soldável")
              └── Tipo   (ex: "Tê 90° PVC soldável - Branco")
```

A **Categoria** é fixa (mapeada às categorias do Revit). **Grupo**, **Modelo** e **Tipo** são
livres — você organiza como fizer sentido para o seu fluxo de trabalho.

## Nesta seção

<div class="grid cards" markdown>

-   :material-database-cog:{ .lg .middle } __[Gerenciador de peças](gerenciador-de-pecas.md)__

    A janela central onde você adiciona famílias do projeto, configura propriedades
    hidráulicas e exporta o catálogo para reutilizar em outras obras.

</div>

!!! info "Em construção"
    Os artigos abaixo serão publicados nos próximos lotes:

    - *Importando o catálogo do Template Padrão*
    - *Exportando e reaproveitando seu catálogo entre projetos*
    - *Configurando comprimentos equivalentes em conexões*
    - *Definindo fixture units por norma (NBR 5626 / ASTM)*
    - *Cadastrando equipamentos: bombas, reservatórios e hidrômetros*

## Pré-requisitos comuns

Para qualquer tarefa nesta seção você vai precisar de:

- [ ] Projeto Revit aberto com o plugin ativado
- [ ] **Configurações gerais** já executada uma vez ([abrir](../primeiros-passos/configuracoes-gerais.md))
- [ ] Famílias hidráulicas **já carregadas** no projeto Revit (ou via *Transfer families*
      do plugin, ou pela carga manual de RFA)

## Fluxo recomendado

1. **Configurações gerais** → define unidades, fluido, padrão da norma
2. **Transfer families** → carrega as famílias OFH no projeto
3. **Gerenciador de peças** → você está aqui — configura propriedades de cada peça
4. **Modelagem** → desenha a rede usando as peças configuradas
5. **Gerenciador de sistemas** → calcula, valida e exporta
