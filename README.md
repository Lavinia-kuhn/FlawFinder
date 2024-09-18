# FlawFinder

IA para a identificação dos motivos de não detecção de
defeitos em testes de QA
Aluna: Lavínia Vitória Kuhn
Escopo
1. Objetivo Principal
Desenvolver uma ferramenta de inteligência artificial (IA) que ajude a identificar por que
certos defeitos não são detectados durante os testes de Quality Assurance (QA). A
ferramenta deve fornecer insights para melhorar a detecção de defeitos e aprimorar as
práticas de QA.
2. O que Está Dentro do Escopo
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
3. O que Está Fora do Escopo
1. 2. 3. Desenvolvimento de Novos Casos de Teste
○ O projeto não incluirá a criação ou desenvolvimento de novos casos de teste
ou a geração de novos conjuntos de dados para testes.
Criação de Novas Ferramentas de Teste
○ A ferramenta de IA não vai desenvolver novas ferramentas de teste, mas sim
integrar-se com as existentes para aprimorar a eficácia das práticas de QA.
Alterações em Ferramentas de QA Existentes
○ O projeto não fará modificações ou atualizações nas ferramentas de QA
existentes, além das integrações necessárias para coleta de dados.
4. Entregáveis do Projeto
1. Ferramenta de IA Funcional
○ Uma ferramenta de IA que analisa dados de QA e identifica causas para a
não detecção de defeitos.
2. Interface de Usuário
○ Um dashboard que permite visualizar e interagir com os dados e insights
fornecidos pela ferramenta.
3. Relatórios e Recomendações
○ Relatórios detalhados sobre os motivos da não detecção de defeitos e
recomendações para melhorar o processo de QA.
4. Documentação
○ Documentação técnica sobre a arquitetura da ferramenta, bem como um
manual do usuário para ajudar a equipe de QA a utilizar a ferramenta de
maneira eficaz.
Roadmap
1. Planejamento e Design
● 1.1. Definição de Requisitos:
○ Requisitos funcionais (relatórios, dashboards, interação com a IA).
○ Requisitos não funcionais (segurança, escalabilidade, desempenho).
● 1.2. Design da Arquitetura:
○ Definição da arquitetura do frontend, backend, e AWS.
○ Escolha das tecnologias e frameworks.
○ Especificação das interfaces entre frontend, backend e AWS.
● 1.3. Criação de Wireframes e Prototipação:
○ Desenho das telas e layouts.
○ Prototipação das principais funcionalidades do frontend.
2. Configuração da Infraestrutura
● 2.1. Configuração do Ambiente de Desenvolvimento:
○ Configuração do ambiente de desenvolvimento para .NET e Angular.
○ Configuração do repositório Git e integração contínua.
● 2.2. Setup da Infraestrutura na AWS:
○ Configuração dos serviços de IA e data prediction.
○ Criação e configuração dos ambientes de desenvolvimento e produção na
AWS.
○ Definição das políticas de segurança e permissões.
3. Desenvolvimento do Backend
● 3.1. Integração com Jira:
○ Implementação da API para buscar dados dos bugs criados no Jira.
○ T estes unitários e de integração.
● 3.2. Comunicação com a IA na AWS:
○ Implementação da lógica para enviar dados à IA e receber resultados.
○ Criação de endpoints REST para suportar o frontend.
● 3.3. Processamento de Dados:
○ Processamento e preparação dos dados recebidos da IA.
○ Implementação de validações e tratamentos de erros.
○ Implementação de logs e monitoramento.
4. Desenvolvimento do Frontend
● 4.1. Criação dos Dashboards:
○ Desenvolvimento dos componentes de visualização de dados.
○ Implementação das funcionalidades de filtragem e exportação de dados.
● 4.2. Integração com o Backend:
○ Implementação de chamadas à API para consumir os dados processados
pelo backend.
○ Tratamento de erros e feedback ao usuário.
● 4.3. Testes de Interface e Usabilidade:
○ T estes de responsividade e acessibilidade.
○ T estes de usabilidade com usuários finais.
5. Validação e Testes
● 5.1. Testes Unitários e de Integração:
○ Cobertura de testes para todas as funcionalidades do backend e frontend.
● 5.2. Testes de Performance e Carga:
○ Avaliação do desempenho da aplicação sob carga.
○ Otimização do tempo de resposta do backend e frontend.
● 5.3. Testes de Segurança:
○ Auditoria de segurança para garantir proteção de dados.
○ T estes de penetração e validação de conformidade com normas de
segurança.
6. Deploy e Lançamento
● 6.1. Deploy na AWS:
○ Deploy da aplicação e serviços de IA na AWS.
○ Configuração de balanceamento de carga, escalabilidade e redundância.
● 6.2. Testes em Produção:
○ Validação final em ambiente de produção.
○ Monitoramento de logs e comportamento da aplicação.
● 6.3. Lançamento para Usuários Finais:
○ Treinamento dos usuários e documentação.
○ Suporte inicial pós-lançamento.
7. Monitoramento e Manutenção
● 7.1. Monitoramento Contínuo:
○ Configuração de ferramentas de monitoramento e alertas.
○ Análise contínua dos logs para prevenção de problemas.
● 7.2. Atualizações e Melhorias:
○ Implementação de melhorias contínuas baseadas no feedback dos usuários.
○ Atualizações de segurança e manutenção de código.
Este roadmap oferece uma visão geral do processo, desde a concepção até o lançamento e
a manutenção da aplicação.
Backlog
Item 1: Planejamento e Design
1. Definição de Requisitos
○ Tarefa 1.1.1: Reunir requisitos funcionais com stakeholders.
○ Tarefa 1.1.2: Definir requisitos não funcionais (desempenho, segurança,
escalabilidade).
○ Tarefa 1.1.3: Documentar todos os requisitos.
2. Design da Arquitetura
○ Tarefa 1.2.1: Desenhar a arquitetura geral da aplicação.
○ Tarefa 1.2.2: Escolher tecnologias e frameworks (ex.: .NET , Angular, AWS
services).
○ Tarefa 1.2.3: Definir interfaces e APIs entre frontend, backend e AWS.
○ Tarefa 1.2.4: Criar diagramas de fluxo de dados e componentes.
3. Criação de Wireframes e Prototipação
○ Tarefa 1.3.1: Criar wireframes para as principais telas do frontend.
○ Tarefa 1.3.2: Prototipar funcionalidades-chave (dashboards, relatórios).
○ Tarefa 1.3.3: Revisar protótipos com stakeholders e ajustar conforme
necessário.
Item 2: Configuração da Infraestrutura
1. Configuração do Ambiente de Desenvolvimento
○ Tarefa 2.1.1: Configurar ambiente de desenvolvimento para .NET .
○ Tarefa 2.1.2: Configurar ambiente de desenvolvimento para Angular.
○ Tarefa 2.1.3: Configurar controle de versão com Git e integração contínua.
○ Tarefa 2.1.4: Criar pipelines de CI/CD para build e deploy automatizados.
2. Setup da Infraestrutura na AWS
○ Tarefa 2.2.1: Configurar serviços de Machine Learning na AWS (ex.:
SageMaker, Lambda).
○ Tarefa 2.2.2: Configurar ambientes de desenvolvimento e produção na AWS.
○ Tarefa 2.2.3: Definir políticas de segurança e permissões no AWS IAM.
○ Tarefa 2.2.4: Configurar monitoramento e logging na AWS.
Item 3: Desenvolvimento do Backend
1. Integração com Jira
○ Tarefa 3.1.1: Estudar a API do Jira e definir endpoints a serem consumidos.
○ Tarefa 3.1.2: Implementar serviço para consumir dados de bugs do Jira.
○ Tarefa 3.1.3: Criar testes unitários para a integração com o Jira.
○ Tarefa 3.1.4: T estar a integração com dados reais do Jira.
2. Comunicação com a IA na AWS
○ Tarefa 3.2.1: Definir o formato dos dados a serem enviados para a IA.
○ Tarefa 3.2.2: Implementar serviço para enviar dados à IA e receber
resultados.
○ Tarefa 3.2.3: Criar endpoints REST para expor os resultados ao frontend.
○ Tarefa 3.2.4: T estar comunicação end-to-end entre backend e IA na AWS.
3. Processamento de Dados
○ Tarefa 3.3.1: Implementar lógica de processamento dos dados recebidos da
IA.
○ Tarefa 3.3.2: Desenvolver validações e tratamento de erros para dados
processados.
○ Tarefa 3.3.3: Criar logs detalhados e monitoramento para o processamento
de dados.
○ Tarefa 3.3.4: T estar a robustez do processamento de dados com diferentes
cenários.
Item 4: Desenvolvimento do Frontend
1. Criação dos Dashboards
○ Tarefa 4.1.1: Definir os indicadores e métricas a serem exibidos nos
dashboards.
○ Tarefa 4.1.2: Desenvolver componentes de visualização de dados (gráficos,
tabelas, etc.).
○ Tarefa 4.1.3: Implementar funcionalidades de filtragem e ordenação nos
dashboards.
○ Tarefa 4.1.4: Desenvolver funcionalidade de exportação de dados (CSV,
PDF).
2. Integração com o Backend
○ Tarefa 4.2.1: Implementar chamadas à API para consumir dados
processados pelo backend.
○ Tarefa 4.2.2: Desenvolver mecanismos de tratamento de erros e exibição de
feedback ao usuário.
○ Tarefa 4.2.3: Integrar componentes de visualização de dados com os
endpoints do backend.
○ Tarefa 4.2.4: T estar a integração entre frontend e backend com diferentes
cenários de dados.
3. Testes de Interface e Usabilidade
○ Tarefa 4.3.1: Realizar testes de responsividade em diferentes dispositivos e
navegadores.
○ Tarefa 4.3.2: Implementar melhorias na acessibilidade da interface.
○ Tarefa 4.3.3: Conduzir testes de usabilidade com usuários finais para validar
a experiência.
○ Tarefa 4.3.4: Fazer ajustes na interface com base no feedback dos testes de
usabilidade.
Item 5: Validação e Testes
1. Testes Unitários e de Integração
○ Tarefa 5.1.1: Escrever testes unitários para todos os serviços e componentes
do backend.
○ Tarefa 5.1.2: Escrever testes unitários para os componentes do frontend.
○ Tarefa 5.1.3: Desenvolver testes de integração para a comunicação entre
backend e AWS.
○ Tarefa 5.1.4: Executar testes end-to-end que cubram o fluxo completo de
dados.
2. Testes de Performance e Carga
○ Tarefa 5.2.1: Realizar testes de carga para avaliar a escalabilidade do
backend.
○ Tarefa 5.2.2: Monitorar o tempo de resposta do frontend sob diferentes
cargas de usuários.
○ Tarefa 5.2.3: Identificar e otimizar gargalos de desempenho na comunicação
com a IA na AWS.
○ Tarefa 5.2.4: Gerar relatórios de desempenho e aplicar otimizações conforme
necessário.
3. Testes de Segurança
○ Tarefa 5.3.1: Realizar uma auditoria de segurança para identificar
vulnerabilidades.
○ Tarefa 5.3.2: Implementar medidas de mitigação para vulnerabilidades
encontradas.
○ Tarefa 5.3.3: Conduzir testes de penetração para garantir a robustez contra
ataques.
○ Tarefa 5.3.4: Validar a conformidade com normas e regulamentações de
segurança.
Item 6: Deploy e Lançamento
1. Deploy na AWS
○ Tarefa 6.1.1: Realizar deploy do backend e serviços de IA na AWS.
○ Tarefa 6.1.2: Configurar balanceamento de carga e escalabilidade
automática na AWS.
○ Tarefa 6.1.3: Implementar estratégias de redundância e recuperação de
desastres.
○ Tarefa 6.1.4: T estar o ambiente de produção antes do lançamento.
2. Testes em Produção
○ Tarefa 6.2.1: Monitorar logs e desempenho da aplicação em produção.
○ Tarefa 6.2.2: Realizar testes funcionais no ambiente de produção.
○ Tarefa 6.2.3: Validar a comunicação entre frontend, backend e IA na AWS em
produção.
○ Tarefa 6.2.4: Corrigir eventuais problemas detectados durante os testes em
produção.
3. Lançamento para Usuários Finais
○ Tarefa 6.3.1: Preparar e distribuir documentação e guias de usuário.
○ Tarefa 6.3.2: Realizar sessões de treinamento para usuários finais e suporte
técnico.
○ Tarefa 6.3.3: Monitorar o feedback dos usuários após o lançamento.
○ Tarefa 6.3.4: Implementar ajustes e correções pós-lançamento com base no
feedback.
Item 7: Monitoramento e Manutenção
1. Monitoramento Contínuo
○ Tarefa 7.1.1: Configurar ferramentas de monitoramento para desempenho e
erros.
○ Tarefa 7.1.2: Implementar alertas para eventos críticos e problemas de
performance.
○ Tarefa 7.1.3: Realizar revisões regulares dos logs para identificação de
padrões anômalos.
○ Tarefa 7.1.4: Monitorar o uso de recursos na AWS e otimizar conforme
necessário.
2. Atualizações e Melhorias
○ Tarefa 7.2.1: Coletar e priorizar feedback dos usuários para novas
funcionalidades.
○ Tarefa 7.2.2: Planejar e executar ciclos de atualização e manutenção da
aplicação.
○ Tarefa 7.2.3: Implementar atualizações de segurança e patches críticos.
○ Tarefa 7.2.4: Revisar e refatorar código para manter a qualidade e a
performance.
Requisitos Funcionais
Código Descrição
RF001 O sistema deve ser capaz de coletar informações vindas do Jira, utilizando
APIs seguras e permitir a configuração de parâmetros de coleta, como
projetos específicos e tipos de issues.
RF002 O sistema deve ser capaz de realizar análise preditiva, tendo como base o
histórico de bugs abertos para identificação de motivos deles terem passado
pelo fluxo de QA sem serem identificados. A análise preditiva deve usar
técnicas de aprendizado de máquina para identificar padrões e correlações, e
deve ser atualizável com novos dados de bugs e testes.
RF003 O sistema deve gerar relatórios e Dashboard apresentando as análises
realizadas
RF004 O sistema deve permitir exportar esses relatórios e dashboards no formato
PDF , apenas para consulta.
RF005 O sistema deve gerar insights a cada fechamento de sprint
RF006 O sistema deve gerar indicadores de aumento de motivos de Bugs sem
validação pelo fluxo de QA
RF007 O sistema deve permitir com que o usuário gere dashboards customizados. A
personalização deve incluir a capacidade de adicionar e remover widgets.
Requisitos não funcionais
Código Descrição
RNF001 A escalabilidade do sistema deve suportar o tamanho dos projetos do Jira.
Neste caso, deve ser capaz de processar grandes volumes de dados sem
degradação significativa de desempenho e suportar a expansão para novos
projetos e equipes.
RNF002 O sistema deve garantir a abertura dos relatórios com no mínimo 5
segundos de espera
RNF003 O sistema deve permitir consultas de até 6 sprints anteriores
RNF004 O sistema deve possuir uma interface fácil e ágil para coleta das
informações, incluindo uma navegação intuitiva com feedbacks claros sobre
o progresso da coleta de dados.
RNF005 Deverá ter disponibilidade de no mínimo 20 horas por dia
RNF006 O sistema deve garantir a integridade dos dados gerados a partir das issues
do Jira, aplicando medidas de segurança para proteger os dados contra
corrupção e garantir que sejam consistentemente sincronizados com o Jira
