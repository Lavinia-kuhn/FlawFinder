# PORTIFOLIO

# Capa
Título do Projeto: Flaw Finder

Resumo: Uso de IA para a identificação dos motivos de não detecção de
defeitos em testes de QA

Aluna: Lavínia Vitória Kuhn

Curso: Engenharia de Software.

# Objetivo Principal
Desenvolver uma ferramenta que faz o uso de inteligência artificial (IA) para auxiliar na identificação do por que
certos defeitos não são detectados durante os testes de Quality Assurance (QA). A
ferramenta deve fornecer informações para melhorar a detecção de defeitos e aprimorar as
práticas de QA.

# O que Está Dentro do Escopo
1. Análise de Dados de Testes
   
 ○ Coleta e Processamento de Dados: Captura e análise de dados históricos
de testes do JIRA e salva no banco de dados interno.

 ○ Detecção de Padrões: Identificação de padrões e correlações nos dados de
teste que indicam motivos para a não detecção de defeitos.

2. Identificação de Causas
   
 ○ Motivos Comuns: Determinação dos motivos mais frequentes para defeitos
não serem detectados, como cobertura inadequada, dados insuficientes ou
problemas de configuração.

 ○ Análise de Padrões: Reconhecimento de padrões associados à falha na
detecção de defeitos em casos de teste específicos.

3. Geração de informações
   
 ○ Relatórios Detalhados: Criação de relatórios que descrevem as causas da
não detecção, auxiliando na percepção de
problemas que são mais prováveis de não serem detectados durante os
testes, permitindo que a equipe de QA foque mais nessas áreas.

4. Integração com Ferramentas de QA Existentes
   
 ○ Compatibilidade e Integração: Desenvolvimento da ferramenta para se
integrar com sistemas e ferramentas de QA já utilizados pela equipe.

5. Desenvolvimento da Interface de Usuário
   
 ○ Dashboard: Design e implementação de uma tela com gráficos para
visualização de dados.

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

○ Uma ferramenta que utiliza IA para analisar dados de QA e identificar causas para a
não detecção de defeitos.

2. Dashboard

○ Um dashboard que permite visualizar e interagir com os dados fornecidos pela ferramenta.

3. Relatório

○ Relatório com informações sobre os motivos da não detecção de defeitos no processo de QA.

5. Documentação

○ Documentação técnica sobre a arquitetura da ferramenta.

# Requisitos Funcionais
RF001 - O sistema deve ser capaz de coletar informações vindas do Jira, utilizando
APIs seguras e permitir a configuração de parâmetros de coleta, como
projetos específicos e tipos de issues.

RF002 - O sistema deve utilizar aprendizado de máquina supervisionado com o algoritmo Random Forest para classificar os motivos pelos quais bugs não foram detectados durante o fluxo de QA. A partir de dados históricos rotulados, a IA preverá os motivos de falhas em novos bugs. O modelo deve ser atualizável com novos dados de bugs e testes para aprimorar continuamente as classificações.

RF003 - O sistema deve gerar relatório e Dashboard apresentando o resultado das análises
realizadas.

RF004 - O sistema deve permitir exportar os relatórios no formato
excel, apenas para consulta.

RF005 - O sistema deve apresentar gráficos com o aumento de motivos de Bugs sem
detecção pelo fluxo de QA.


# Requisitos não funcionais
RNF001 - A escalabilidade do sistema deve suportar o tamanho dos projetos do Jira.
Neste caso, deve ser capaz de processar grandes volumes de dados sem
degradação significativa de desempenho e suportar a expansão para novos
projetos e equipes.

RNF002 - O sistema deve garantir a abertura dos relatórios com no mínimo 5
segundos de espera.

RNF003 - O sistema deve possuir uma interface fácil e ágil para coleta das
informações.

RNF004 - Deverá ter disponibilidade de no mínimo 20 horas por dia.

RNF005 - O sistema deve garantir a integridade dos dados gerados a partir das issues
do Jira, aplicando medidas de segurança para proteger os dados contra
corrupção e garantir que sejam consistentemente sincronizados com o Jira.
