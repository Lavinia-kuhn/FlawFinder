
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'VIEW_GLOBAL_TIMEOFFSHIFT')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Tempo Fora de Turno',
        'Time Off Shift',
        'Tiempo Fuera de Turno',
        'VIEW_GLOBAL_TIMEOFFSHIFT', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Tempo Fora de Turno',
        ENLocal = 'Time Off Shift',
        ESLocal= 'Tiempo Fuera de Turno'
        where IDScreen = -1 AND TranslationKey = 'VIEW_GLOBAL_TIMEOFFSHIFT'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'NSHIFTTIME')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Tempo Fora de Turno',
        'Time Off Shift',
        'Tiempo Fuera de Turno',
        'NSHIFTTIME', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Tempo Fora de Turno',
        ENLocal = 'Time Off Shift',
        ESLocal= 'Tiempo Fuera de Turno'
        where IDScreen = -1 AND TranslationKey = 'NSHIFTTIME'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'PLANNEDSTOP1')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Parada Planejada 1',
        'Planned Stop 1',
        'Parada Planificada 1',
        'PLANNEDSTOP1', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Parada Planejada 1',
        ENLocal = 'Planned Stop 1',
        ESLocal= 'Parada Planificada 1'
        where IDScreen = -1 AND TranslationKey = 'PLANNEDSTOP1'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'PLANNEDSTOP2')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Parada Planejada 2',
        'Planned Stop 2',
        'Parada Planificada 2',
        'PLANNEDSTOP2', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Parada Planejada 2',
        ENLocal = 'Planned Stop 2',
        ESLocal= 'Parada Planificada 2'
        where IDScreen = -1 AND TranslationKey = 'PLANNEDSTOP2'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'PRODUCTIVETIME')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Tempo Produtivo Líquido',
        'Net Productive Time',
        'Tiempo Productivo Neto',
        'PRODUCTIVETIME', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Tempo Produtivo Líquido',
        ENLocal = 'Net Productive Time',
        ESLocal= 'Tiempo Productivo Neto'
        where IDScreen = -1 AND TranslationKey = 'PRODUCTIVETIME'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'CUSTOMINDICATORSPRODUCTIVETIME')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Tempo Produtivo Líquido',
        'Net Productive Time',
        'Tiempo Productivo Neto',
        'CUSTOMINDICATORSPRODUCTIVETIME', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Tempo Produtivo Líquido',
        ENLocal = 'Net Productive Time',
        ESLocal= 'Tiempo Productivo Neto'
        where IDScreen = -1 AND TranslationKey = 'CUSTOMINDICATORSPRODUCTIVETIME'
    end

GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'QTY')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Quantidade',
        'Quantity',
        'Cantidad',
        'QTY', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Quantidade',
        ENLocal = 'Quantity',
        ESLocal= 'Cantidad'
        where IDScreen = -1 AND TranslationKey = 'QTY'
    end
GO
if not exists(select IDLocalization from TBLLocalizations where IDScreen = -1 and TranslationKey = 'PORCENTAGE')
    begin
        insert into TBLLocalizations (IDApplication, IDScreen, PTLocal, ENLocal, ESLocal, TranslationKey, FlgProduct, FlgEnable)
        values (1, -1,
        'Porcentagem',
        'Percentage',
        'Porcentaje',
        'PORCENTAGE', 1, 1)
    end
else
    begin
        update TBLLocalizations
        set PTLocal = 'Porcentagem',
        ENLocal = 'Percentage',
        ESLocal= 'Porcentaje'
        where IDScreen = -1 AND TranslationKey = 'PORCENTAGE'
    end
GO
-- DASHBOARD --

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'SAVEANDON',
@PTLocal = 'Salvar Andon',
@ENLocal = 'Save Andon',
@ESLocal = 'Ahorrar Andon',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'SAVEDASHBOARD',
@PTLocal = 'Salvar Dashboard',
@ENLocal = 'Save Dashboard',
@ESLocal = 'Ahorrar Dashboard',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PLACEHOLDERANDONNAME',
@PTLocal = 'Digite um nome para o Andon',
@ENLocal = 'Enter Andon name',
@ESLocal = 'Ingresse el nombre del Andon',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'SMALL',
@PTLocal = 'Pequeno',
@ENLocal = 'Small',
@ESLocal = 'Pequeño',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'MEDIUM',
@PTLocal = 'Médio',
@ENLocal = 'Medium',
@ESLocal = 'Medio',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Grande',
@PTLocal = 'Grande',
@ENLocal = 'Large',
@ESLocal = 'Grande',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'CURRENTSHIFT',
@PTLocal = 'Turno Atual',
@ENLocal = 'Current Shift',
@ESLocal = 'Cambio Atual',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PREVIOUSSHIFT',
@PTLocal = 'Turno Atual/Anterior',
@ENLocal = 'Current/Previous Shift',
@ESLocal = 'Cambio Atual/Anterior',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'LAST3SHIFT',
@PTLocal = 'Últimos 3 turnos',
@ENLocal = 'Last 3 Shifts',
@ESLocal = 'Últimos 3 turnos',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'MICROCAROUSEL',
@PTLocal = 'Carrossel',
@ENLocal = 'Carousel',
@ESLocal = 'Carrusel',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'MICRORESOURCE',
@PTLocal = 'Recurso',
@ENLocal = 'Resource',
@ESLocal = 'Recurso',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'ON',
@PTLocal = 'Ligado',
@ENLocal = 'ON',
@ESLocal = 'Encendido',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'OFF',
@PTLocal = 'Desligado',
@ENLocal = 'OFF',
@ESLocal = 'Apagado',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PLACEHOLDERMICROFILTER',
@PTLocal = 'Selecione um filtro',
@ENLocal = 'Enter filter',
@ESLocal = 'Ingresse el filtro',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PLACEHOLDERMICROTIME',
@PTLocal = 'Selecione tempo do recurso',
@ENLocal = 'Enter resource time',
@ESLocal = 'Ingresse el tiempo del recurso',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PLACEHOLDERMICROCAROUSEL',
@PTLocal = 'Selecione ligado/desligado',
@ENLocal = 'Enter ON/OFF',
@ESLocal = 'Ingresse ON/Off',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'PLACEHOLDERMICRORESOURCE',
@PTLocal = 'Selecione um recurso',
@ENLocal = 'Enter resource',
@ESLocal = 'Ingresse el recurso',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'PRODUCTIONDETAIL', @TranslationKey = 'LASTSHIFTREWORKQTY',
@PTLocal = 'Retrabalho Turno Anterior',
@ENLocal = 'Previous Shift Rework',
@ESLocal = 'Retrabajo Último Cambio',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


-- Confirmar esta parte com o GB, pois acho estranho o jeito que fica no banco, são os nomes dos cards do dashboard

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Gantt',
@PTLocal = 'Gantt',
@ENLocal = 'Gantt',
@ESLocal = 'Gantt',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Status',
@PTLocal = 'Status',
@ENLocal = 'Status',
@ESLocal = 'Estatus',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Refugo',
@PTLocal = 'Refugo',
@ENLocal = 'Scraps',
@ESLocal = 'Rechazo',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Paradas',
@PTLocal = 'Paradas',
@ENLocal = 'Stops',
@ESLocal = 'Paradas',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Retrabalho',
@PTLocal = 'Retrabalho',
@ENLocal = 'Reworks',
@ESLocal = 'Retrabajo',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Microtendências',
@PTLocal = 'Microtendências',
@ENLocal = 'Microtrends',
@ESLocal = 'Microtendencias',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'OEE',
@PTLocal = 'OEE',
@ENLocal = 'OEE',
@ESLocal = 'OEE',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Status Atual',
@PTLocal = 'Status Atual',
@ENLocal = 'Actual Status',
@ESLocal = 'Estatus Actual',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Detalhes de Produção',
@PTLocal = 'Detalhes de Produção',
@ENLocal = 'Production Details',
@ESLocal = 'Detalles de Producción',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Mapa',
@PTLocal = 'Mapa',
@ENLocal = 'Map',
@ESLocal = 'Mapa',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO





-- INICIO - ANDON / VIEWANDON --
EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'EDIT',
@PTLocal = 'Configuração',
@ENLocal = 'Settings',
@ESLocal = 'Configuración',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'CODE',
@PTLocal = 'Nome',
@ENLocal = 'Name',
@ESLocal = 'Nombre',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'LINK',
@PTLocal = 'Link',
@ENLocal = 'Link',
@ESLocal = 'Link',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'CONTENTTIME',
@PTLocal = 'Tempo de Atualização',
@ENLocal = 'Refresh Time',
@ESLocal = 'Tiempo del Actualización',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'NAMEMAP',
@PTLocal = 'Mapa',
@ENLocal = 'Map',
@ESLocal = 'Mapa',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'GRIDPAGETIME',
@PTLocal = 'Tempo de Atualização Grid',
@ENLocal = 'Grid Refresh Time',
@ESLocal = 'Tiempo del Actualización Grid',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'SHIFTCONFIG',
@PTLocal = 'Turno',
@ENLocal = 'Shift',
@ESLocal = 'Cambio',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'CHANGETIME',
@PTLocal = 'Tempo do Carrossel',
@ENLocal = 'Carousel Time',
@ESLocal = 'Tiempo del Carrusel',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO


EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'CONTENTTIME',
@PTLocal = 'Tempo de Atualização',
@ENLocal = 'Refresh Time',
@ESLocal = 'Tiempo del Actualización',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'TIMECAROUSEL',
@PTLocal = 'Tempo do Carrossel',
@ENLocal = 'Carousel Time',
@ESLocal = 'Tiempo del Carrusel',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'GRIDPAGETIME',
@PTLocal = 'Tempo do Grid',
@ENLocal = 'Grid Time',
@ESLocal = 'Tiempo del Grid',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'SELECTMAP',
@PTLocal = 'Selecione o Mapa',
@ENLocal = 'Select Map',
@ESLocal = 'Seleccione un mapa',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'CONTENTTIMEPLACEHOLDER',
@PTLocal = 'Digite um Tempo de Atualização',
@ENLocal = 'Enter Refresh Time',
@ESLocal = 'Ingresse el Tiempo del Actualización',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'TIMECAROUSELPLACEHOLDER',
@PTLocal = 'Digite um Tempo para o Carrosel',
@ENLocal = 'Enter Carousel Time',
@ESLocal = 'Ingresse el Tiempo del Carrusel',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'GRIDPAGETIMEPLACEHOLDER',
@PTLocal = 'Digite um Tempo para o Grid',
@ENLocal = 'Enter Grid Time',
@ESLocal = 'Ingresse el Tiempo del Grid',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'ANDONPREFERENCES',
@PTLocal = 'Preferências do Andon',
@ENLocal = 'Andon Preferences',
@ESLocal = 'Preferencias del Andon',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'TITLEDELETEANDON',
@PTLocal = 'Deletar Andon?',
@ENLocal = 'Delete Andon?',
@ESLocal = '¿Eliminar Andon?',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWANDON', @TranslationKey = 'MSGDELETEANDON',
@PTLocal = 'Deseja deletar o',
@ENLocal = 'Do you want to delete',
@ESLocal = '¿Quieres eliminar',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'EDITTABLE',
@PTLocal = 'Editar',
@ENLocal = 'Edit',
@ESLocal = 'Editar',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'DELETETABLE',
@PTLocal = 'Delete',
@ENLocal = 'Delete',
@ESLocal = 'Eliminar',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'GRIDSTERCONFIG',
@PTLocal = 'Configuração Gridster',
@ENLocal = 'Gridster Settings',
@ESLocal = 'Configuración Gridster',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'IDANDONHD',
@PTLocal = 'ID Andon',
@ENLocal = 'ID Andon',
@ESLocal = 'ID Andon',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'ANDON', @TranslationKey = 'IDMAP',
@PTLocal = 'ID Mapa',
@ENLocal = 'ID Map',
@ESLocal = 'ID Mapa',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

-- PCFAC-3837
EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL1CODE',
    @PTLocal = 'Cód. Nível de Supervisão 1',
    @ENLocal = 'Sup. Level 1 Code',
    @ESLocal = 'Cód. Nivel Sup. 1',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL1NAME',
    @PTLocal = 'Nome Nível de Supervisão 1',
    @ENLocal = 'Sup. Level 1 Name',
    @ESLocal = 'Nombre Nivel Sup. 1',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL1DTMGOAL',
    @PTLocal = 'Meta % DTM Nível Sup. 1',
    @ENLocal = 'Sup. Level 1 % DTM Goal',
    @ESLocal = 'Meta % DTM Nivel Sup. 1',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL2CODE',
    @PTLocal = 'Cód. Nível de Supervisão 2',
    @ENLocal = 'Sup. Level 2 Code',
    @ESLocal = 'Cód. Nivel Sup. 2',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL2NAME',
    @PTLocal = 'Nome Nível de Supervisão 2',
    @ENLocal = 'Sup. Level 2 Name',
    @ESLocal = 'Nombre Nivel Sup. 2',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SUPLEVEL2DTMGOAL',
    @PTLocal = 'Meta % DTM Nível Sup. 2',
    @ENLocal = 'Sup. Level 2 % DTM Goal',
    @ESLocal = 'Meta % DTM Nivel Sup. 2',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'TABLETAB',
    @PTLocal = 'Tabela',
    @ENLocal = 'Table',
    @ESLocal = 'Tabla',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'CHARTTAB',
    @PTLocal = 'Gráfico',
    @ENLocal = 'Chart',
    @ESLocal = 'Grafico',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'Hierarchy',
    @PTLocal = 'Selecione o nível hierárquico da meta:',
    @ENLocal = 'Select the hierarchical level of the goal:',
    @ESLocal = 'Seleccione el nivel jerárquico del meta:',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'Plant',
    @PTLocal = 'Planta',
    @ENLocal = 'Plant',
    @ESLocal = 'Planta',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'Area',
    @PTLocal = 'Área',
    @ENLocal = 'Area',
    @ESLocal = 'Área',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'Sector',
    @PTLocal = 'Setor',
    @ENLocal = 'Sector',
    @ESLocal = 'Sector',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'ManagerGroup',
    @PTLocal = 'Grupo Gerencial',
    @ENLocal = 'Manager Group',
    @ESLocal = 'Grupo Gerencial',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SupLevel1',
    @PTLocal = 'Supervisão 1',
    @ENLocal = 'Supervision 1',
    @ESLocal = 'Supervisión 1',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'SupLevel2',
    @PTLocal = 'Supervisão 2',
    @ENLocal = 'Supervision 2',
    @ESLocal = 'Supervisión 2',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'G0132', @TranslationKey = 'Resource',
    @PTLocal = 'Recurso',
    @ENLocal = 'Resource',
    @ESLocal = 'Recurso',
    @AplicationCode = 'PCF4View', @FlgProduct = 1
GO

-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO



-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0131–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0131', 'G0131–Tendência DTM OEE', 'G0131–DTM OEE Trend', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0131–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0131–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0131'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0131', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0131',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0131')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0131
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0131'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0131-Tendência DTM OEE','G0131-DTM OEE Trends', 'G0131-Tendencia DTM OEE',1,1,'VIEW_MENU_G0131',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0131

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0131', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0131

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0131', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0131/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- -----------------------------------------ABAS-----------------------------------------
-- --------------------------------------------------------------------------------------
--ABA TABELA - G0131

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0131', 'ReportTab', 'ReportTab', 'REPORT',1, 'CHARTTAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0131

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0131', 'goalcolumns', 'ReportChart', 'CHARTTAB' , 1, 'G0131/v1/chart',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--TRADUÇÃO DA ABA TABELA

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'TABLETAB'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('Tabela','Table',1,1,'TABLETAB',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO
-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO



-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0132', 'G0132–Relatório de DTM OEE', 'G0132–OEE DTM Report', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0132'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0132', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0132',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0132')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0132
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0132'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0132-Relatório de DTM OEE','G0132-OEE DTM Report', 'G0132-Reporte de DTM OEE',1,1,'VIEW_MENU_G0132',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0132', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0132', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0132/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- -----------------------------------------ABAS-----------------------------------------
-- --------------------------------------------------------------------------------------
--ABA TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0132', 'ReportTab', 'ReportTab', 'REPORT',1, 'CHARTTAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0132', 'goalcolumns', 'ReportChart', 'CHARTTAB' , 1, 'G0132/v1/chart',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--TRADUÇÃO DA ABA TABELA

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'TABLETAB'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('Tabela','Table',1,1,'TABLETAB',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO
--GOALDTM
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'GOALDTM'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta DTM',
			'DTM Goal',
			'Meta DTM',
			1,
			1,
			-1,
			'GOALDTM')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta DTM', ENLocal = 'DTM Goal' , ESLocal = 'Meta DTM'
		WHERE IDScreen = -1
				AND TranslationKey = 'GOALDTM'
END
GO

--DTM
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'DTM'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'DTM',
			'DTM',
			'DTM',
			1,
			1,
			-1,
			'DTM')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'DTM', ENLocal = 'DTM' , ESLocal = 'DTM'
		WHERE IDScreen = -1
				AND TranslationKey = 'DTM'
END
GO


----G0132 RADIO GROUP Hierar
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'CHARTTAB'
AND FieldName = 'Hierarchy'
AND TableName = 'registersHierarchy'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('registersHierarchy', 'Hierarchy', 'FilterOptions','radio', 'CHARTTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Plant'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Plant', 'Plant', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Area
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Area'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Area', 'Area', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Sector
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Sector'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Sector', 'Sector', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - ManagerGroup
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'ManagerGroup'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ManagerGroup', 'ManagerGroup', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - SupLevel1
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'SupLevel1'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SupLevel1', 'SupLevel1', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
----G0132 RADIO Hierarchy - SupLevel2
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'SupLevel2'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SupLevel2', 'SupLevel2', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Resource
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Resource'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Resource', 'Resource', 'FilterValues','radio', 'registersHierarchy' , 1, 'true',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO



-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0146', 'G0146–Histórico de Chamados e Soluções', 'G0146–History of Calls and Solutions', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0146'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0146', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0146',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0146')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0146
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0146'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0146-Histórico de Chamados e Soluções','G0146-History of Calls and Solutions', 'G0146-Historial de Llamadas y Soluciones',1,1,'VIEW_MENU_G0146',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0146/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterShift', 'MainFilterShift', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication =
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0012
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'traceType'
AND TableName = 'registersType'
AND FieldType = 'checkbox')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('registersType', 'traceType', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0012 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersType'
AND FieldName = 'trace'
AND FieldType = 'checkbox')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('trace', 'trace', 'FilterValues','checkbox', 'registersType' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO



-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0149', 'G0149-Paradas de Manutenção sem OM', 'G0149–Maintenance Shutdowns without OM', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0149'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0149', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0149',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0149')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0146
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0149'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0149-Paradas de Manutenção sem OM','G0149-Maintenance Shutdowns without OM', 'G0149-Paradas de Mantenimiento sin OM',1,1,'VIEW_MENU_G0149',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0149

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0149', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0149', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0149/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'MainFilterShift', 'MainFilterShift', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO



-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0146', 'G0146-Hístorico de Chamados e Soluções', 'G0146–History of Calls and Solutions', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0146'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0146', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0146',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0146')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0146
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0146'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0146-Hístorico de Chamados e Soluções','G0146-History of Calls and Solutions', 'G0146-Historial de Llamadas y Soluciones',1,1,'VIEW_MENU_G0146',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0146', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0146/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO




