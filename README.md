# PORTIFOLIO

# Capa
Título do Projeto: Flaw Finder

Resumo: Uso de IA para a identificação dos motivos de não detecção de
defeitos em testes de QA

Aluna: Lavínia Vitória Kuhn

Curso: Engenharia de Software.

# Objetivo Principal
Desenvolver uma ferramenta de inteligência artificial (IA) que ajude a identificar por que
certos defeitos não são detectados durante os testes de Quality Assurance (QA). A
ferramenta deve fornecer insights para melhorar a detecção de defeitos e aprimorar as
práticas de QA.

# O que Está Dentro do Escopo
1. Análise de Dados de Testes
   
 ○ Coleta e Processamento de Dados: Captura e análise de dados históricos
de testes resultados de testes

 ○ Detecção de Padrões: Identificação de padrões e correlações nos dados de
teste que indicam motivos para a não detecção de defeitos.

2. Identificação de Causas
   
 ○ Motivos Comuns: Determinação dos motivos mais frequentes para defeitos
não serem detectados, como cobertura inadequada, dados insuficientes ou
problemas de configuração.

 ○ Análise de Padrões: Reconhecimento de padrões associados à falha na
detecção de defeitos em casos de teste específicos.

3. Geração de Insights e Recomendações
   
 ○ Relatórios Detalhados: Criação de relatórios que descrevem as causas da
não detecção e fornecem predições, auxiliando na percepção antecipada de
problemas que são mais prováveis de não serem detectados durante os
testes, permitindo que a equipe de QA foque mais nessas áreas.

 ○ Sugestões para Melhoria: Propostas de ajustes nas práticas de QA
baseadas nos insights obtidos.

4. Integração com Ferramentas de QA Existentes
   
 ○ Compatibilidade e Integração: Desenvolvimento da ferramenta para se
integrar com sistemas e ferramentas de QA já utilizados pela equipe.

 ○ Insights em Tempo Real: Implementação de funcionalidades para fornecer
insights e recomendações durante ou após o processo de teste.

5. Desenvolvimento da Interface de Usuário
   
 ○ Dashboard: Design e implementação de um painel de controle para
visualização de dados e insights.

 ○ Facilidade de Uso: Criação de uma interface intuitiva e fácil de usar para
interação com a ferramenta.

# O que Está Fora do Escopo
1. Desenvolvimento de Novos Casos de Teste
○ O projeto não incluirá a criação ou desenvolvimento de novos casos de teste
ou a geração de novos conjuntos de dados para testes.

3. Criação de Novas Ferramentas de Teste
○ A ferramenta de IA não vai desenvolver novas ferramentas de teste, mas sim
integrar-se com as existentes para aprimorar a eficácia das práticas de QA.

4. Alterações em Ferramentas de QA Existentes
○ O projeto não fará modificações ou atualizações nas ferramentas de QA
existentes, além das integrações necessárias para coleta de dados.

# Entregáveis do Projeto
1. Ferramenta de IA Funcional
○ Uma ferramenta de IA que analisa dados de QA e identifica causas para a
não detecção de defeitos.

2. Interface de Usuário
○ Um dashboard que permite visualizar e interagir com os dados e insights
fornecidos pela ferramenta.

3. Relatórios e Recomendações
○ Relatórios detalhados sobre os motivos da não detecção de defeitos e
recomendações para melhorar o processo de QA.

5. Documentação
○ Documentação técnica sobre a arquitetura da ferramenta, bem como um
manual do usuário para ajudar a equipe de QA a utilizar a ferramenta de
maneira eficaz.

# Requisitos Funcionais
RF001 - O sistema deve ser capaz de coletar informações vindas do Jira, utilizando
APIs seguras e permitir a configuração de parâmetros de coleta, como
projetos específicos e tipos de issues.

RF002 - O sistema deve ser capaz de realizar análise preditiva, tendo como base o
histórico de bugs abertos para identificação de motivos deles terem passado
pelo fluxo de QA sem serem identificados. A análise preditiva deve usar
técnicas de aprendizado de máquina para identificar padrões e correlações, e
deve ser atualizável com novos dados de bugs e testes.

RF003 - O sistema deve gerar relatórios e Dashboard apresentando as análises
realizadas

RF004 - O sistema deve permitir exportar esses relatórios e dashboards no formato
PDF , apenas para consulta.
RF005 - O sistema deve gerar insights a cada fechamento de sprint

RF006 - O sistema deve gerar indicadores de aumento de motivos de Bugs sem
validação pelo fluxo de QA

RF007 - O sistema deve permitir com que o usuário gere dashboards customizados. A
personalização deve incluir a capacidade de adicionar e remover widgets.

# Requisitos não funcionais
RNF001 - A escalabilidade do sistema deve suportar o tamanho dos projetos do Jira.
Neste caso, deve ser capaz de processar grandes volumes de dados sem
degradação significativa de desempenho e suportar a expansão para novos
projetos e equipes.

RNF002 - O sistema deve garantir a abertura dos relatórios com no mínimo 5
segundos de espera

RNF003 - O sistema deve permitir consultas de até 6 sprints anteriores

RNF004 - O sistema deve possuir uma interface fácil e ágil para coleta das
informações, incluindo uma navegação intuitiva com feedbacks claros sobre
o progresso da coleta de dados.

RNF005 - Deverá ter disponibilidade de no mínimo 20 horas por dia

RNF006 - O sistema deve garantir a integridade dos dados gerados a partir das issues
do Jira, aplicando medidas de segurança para proteger os dados contra
corrupção e garantir que sejam consistentemente sincronizados com o Jira
