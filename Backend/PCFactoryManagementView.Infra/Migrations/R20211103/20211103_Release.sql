--TELA G0142–Analítico de Inspeção
IF NOT EXISTS (SELECT IDScreen  FROM TBLScreen WHERE Code = 'G0142'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0142', 'G0142–Diário de Bordo', 'G0142–Logbook', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 1)
END
GO
-- OPERATION SCREEN-----------------------------------
--TELA G0142–Analítico de Inspeção

IF NOT EXISTS (SELECT IDOperationScreen  FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES ((SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'
				AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

--VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
--TELA G0142
IF NOT EXISTS (SELECT IDProfileUserGroup  FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES ((SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                         (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'
						  AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
 
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
--TELA G0142–Analítico de Inspeção

IF NOT EXISTS (SELECT IDScreenMenu  FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0142'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0142', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'), 0, 1, 'G0142',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/charspec/G0142')
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0142

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0142', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0142

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0142', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0142/v1/CharacteristicTable ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTCOMPONENT'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Componente de Produto',
			'Product Components',
			1,
			1,
			-1,
			'VIEW_GLOBAL_PRODUCTCOMPONENT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Componente de Produto', ENLocal = 'Product Components' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTCOMPONENT'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTCOMPONENT'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Todos Componentes de Produto',
			'All Product Components',
			1,
			1,
			-1,
			'VIEW_GLOBAL_ALL_PRODUCTCOMPONENT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Todos Componentes de Produto', ENLocal = 'All Product Components' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTCOMPONENT'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTFAMILY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Família de Produto',
			'Product Family',
			1,
			1,
			-1,
			'VIEW_GLOBAL_PRODUCTFAMILY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Família de Produto', ENLocal = 'Product Family' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTFAMILY'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTFAMILY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Todas Famílias de Produto',
			'All Product Families',
			1,
			1,
			-1,
			'VIEW_GLOBAL_ALL_PRODUCTFAMILY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Todas Famílias de Produto', ENLocal = 'All Product Families' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTFAMILY'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_CHARACTERISTICDOMAIN'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Domínio Alternativo',
			'Alternative Domain',
			1,
			1,
			-1,
			'VIEW_GLOBAL_CHARACTERISTICDOMAIN')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Domínio Alternativo', ENLocal = 'Alternative Domain' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_CHARACTERISTICDOMAIN'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_CHARACTERISTICDOMAIN'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Todos Domínios Alternativos',
			'All Alternative Domains',
			1,
			1,
			-1,
			'VIEW_GLOBAL_ALL_CHARACTERISTICDOMAIN')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Todos Domínios Alternativos', ENLocal = 'All Alternative Domains' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_CHARACTERISTICDOMAIN'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTATTRIBUTE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Produto x Atributo',
			'Product x Attribute',
			1,
			1,
			-1,
			'VIEW_GLOBAL_PRODUCTATTRIBUTE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Produto x Atributo', ENLocal = 'Product x Attribute' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_PRODUCTATTRIBUTE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = -1 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTATTRIBUTE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Todos Produtos x Atributos',
			'All Products x Attributes',
			1,
			1,
			-1,
			'VIEW_GLOBAL_ALL_PRODUCTATTRIBUTE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Todos Produtos x Atributos', ENLocal = 'All Products x Attributes' 
	WHERE IDScreen = -1
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_GLOBAL_ALL_PRODUCTATTRIBUTE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'IDCHARACTERISTICSPEC'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'ID. Espec. Característica',
			'Spec. Characteristic ID.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'IDCHARACTERISTICSPEC')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'ID. Espec. Característica', ENLocal = 'Spec. Characteristic ID.' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'IDCHARACTERISTICSPEC'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Código',
			'Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Código', ENLocal = 'Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'NAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome',
			'Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'NAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome', ENLocal = 'Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'NAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DESCRIPTION'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Descrição',
			'Description',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'DESCRIPTION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Descrição', ENLocal = 'Description' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DESCRIPTION'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Produto',
			'Prod. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Produto', ENLocal = 'Prod. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODCODE'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Produto',
			'Prod. Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Produto', ENLocal = 'Prod. Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODRAWCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Comp. Produto',
			'Prod. Comp. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODRAWCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Comp. Produto', ENLocal = 'Prod. Comp. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODRAWCODE'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODRAWNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Comp. Produto',
			'Prod. Comp. Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODRAWNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Comp. Produto', ENLocal = 'Prod. Comp. Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODRAWNAME'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODFAMCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Fam. Produto',
			'Prod. Fam. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODFAMCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Fam. Produto', ENLocal = 'Prod. Fam. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODFAMCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODFAMNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Fam. Produto',
			'Prod. Fam. Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODFAMNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Fam. Produto', ENLocal = 'Prod. Fam. Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODFAMNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODATTRCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Prod. x Attr.',
			'Prod. vs Attr. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PRODATTRCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Prod. x Attr.', ENLocal = 'Prod. vs Attr. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODATTRCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Ordem de Produção',
			'Work Order Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'WOHDCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Ordem de Produção', ENLocal = 'Work Order Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Operação',
			'Work Order Det. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'WODETCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Operação', ENLocal = 'Work Order Det. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Recurso',
			'Resource Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'RESCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Recurso', ENLocal = 'Resource Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Recurso',
			'Resource Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'RESNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Recurso', ENLocal = 'Resource Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNAME'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARDOMAINCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Domínio Alternativo',
			'Alternative Domain Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CHARDOMAINCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Domínio Alternativo', ENLocal = 'Alternative Domain Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARDOMAINCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARDOMAINNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Domínio Alternativo',
			'Alternative Domain Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CHARDOMAINNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Domínio Alternativo', ENLocal = 'Alternative Domain Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARDOMAINNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNITSCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Unidade',
			'Unit Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'UNITSCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Unidade', ENLocal = 'Unit Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNITSCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNITSNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Unidade',
			'Unit Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'UNITSNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Unidade', ENLocal = 'Unit Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNITSNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRHDCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Atributo',
			'Attribute Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'ATTRHDCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Atributo', ENLocal = 'Attribute Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRHDCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRHDNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Atributo',
			'Attribute Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'ATTRHDNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Atributo', ENLocal = 'Attribute Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRHDNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSTRTYPECODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Tipo Instrumento',
			'Instrument Type Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'INSTRTYPECODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Tipo Instrumento', ENLocal = 'Instrument Type Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSTRTYPECODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSTRTYPENAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Tipo Instrumento',
			'Instrument Type Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'INSTRTYPENAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Tipo Instrumento', ENLocal = 'Instrument Type Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSTRTYPENAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INPUTTYPE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tipo de Entrada',
			'Input Type',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'INPUTTYPE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tipo de Entrada', ENLocal = 'Input Type' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INPUTTYPE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VALUECLASS'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Classe de Valores',
			'Value Class',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'VALUECLASS')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Classe de Valores', ENLocal = 'Value Class' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VALUECLASS'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LCL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LIC',
			'LCL',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'LCL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LIC', ENLocal = 'LCL' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LCL'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UCL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LSC',
			'UCL',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'UCL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LSC', ENLocal = 'UCL' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UCL'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LSL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LIE',
			'LSL',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'LSL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LIE', ENLocal = 'LSL' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LSL'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'USL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LSE',
			'USL',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'USL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LSE', ENLocal = 'USL' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'USL'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LCA'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LIA',
			'LCA',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'LCA')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LIA', ENLocal = 'LCA' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'LCA'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UCA'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'LSA',
			'UCA',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'UCA')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'LSA', ENLocal = 'UCA' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UCA'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RANGE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Faixa',
			'Range',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'RANGE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Faixa', ENLocal = 'Range' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RANGE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ESPECVALUE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Valor Especificado',
			'Spec. Value',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'ESPECVALUE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Valor Especificado', ENLocal = 'Spec. Value' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ESPECVALUE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'BESTVALUE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Melhor Valor',
			'Best Value',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'BESTVALUE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Melhor Valor', ENLocal = 'Best Value' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'BESTVALUE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEVCAUSECODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Motivo Não Conf.',
			'Non-Conformity Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'DEVCAUSECODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Motivo Não Conf.', ENLocal = 'Non-Conformity Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEVCAUSECODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEVCAUSENAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Motivo Não Conf.',
			'Non-Conformity Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'DEVCAUSENAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Motivo Não Conf.', ENLocal = 'Non-Conformity Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEVCAUSENAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ACTION'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Obrigatoriedade de Justificativa',
			'Mandatory Justification',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'ACTION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Obrigatoriedade de Justificativa', ENLocal = 'Mandatory Justification' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ACTION'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Característica',
			'Characteristic Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CHARACCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Característica', ENLocal = 'Characteristic Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Característica',
			'Characteristic Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CHARACNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Característica', ENLocal = 'Characteristic Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TABLETAB'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Espec. Característica',
			'Characteristic Spec',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'TABLETAB')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Espec. Característica', ENLocal = 'Characteristic Spec' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TABLETAB'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_MENU_G0142'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'G0142-Diário de Bordo',
			'G0142-Logbook',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'VIEW_MENU_G0142')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'G0142-Diário de Bordo', ENLocal = 'G0142-Logbook' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VIEW_MENU_G0142'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PAGETITLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Diário de Bordo',
			'Logbook',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'PAGETITLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Diário de Bordo', ENLocal = 'Logbook' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PAGETITLE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACTYPE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tipo de Característica',
			'Characteristic Type',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'CHARACTYPE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tipo de Característica', ENLocal = 'Characteristic Type' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'CHARACTYPE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VARCHARTTYPECODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tipo de Grafico (Var.)',
			'Var. Graph. Type',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'VARCHARTTYPECODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tipo de Grafico (Var.)', ENLocal = 'Var. Graph. Type' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VARCHARTTYPECODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRCHARTTYPECODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tipo de Grafico (Atr.)',
			'Attr. Graph. Type',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142'),
			'ATTRCHARTTYPECODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tipo de Grafico (Atr.)', ENLocal = 'Attr. Graph. Type' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ATTRCHARTTYPECODE'
END
GO

-- VIEW_MENU_G0001
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0001'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
	UPDATE TBLScreenMenus
		SET MenuOrder = 0
	WHERE Code = 'VIEW_MENU_G0001' AND ShortCut = 'G0001'
 END
GO

-- VIEW_MENU_G0002
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0002'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 1
 WHERE Code = 'VIEW_MENU_G0002' AND ShortCut = 'G0002'
 END

GO

-- VIEW_MENU_G0004
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0004'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 2
 WHERE Code = 'VIEW_MENU_G0004' AND ShortCut = 'G0004'
 END

GO

-- VIEW_MENU_G0006
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0006'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 3
 WHERE Code = 'VIEW_MENU_G0006' AND ShortCut = 'G0006'
 END

GO

-- VIEW_MENU_G0007
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0007'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 4
 WHERE Code = 'VIEW_MENU_G0007' AND ShortCut = 'G0007'
 END

GO

-- VIEW_MENU_G0008
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0008'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 5
 WHERE Code = 'VIEW_MENU_G0008' AND ShortCut = 'G0008'
 END

GO

-- VIEW_MENU_G0009
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0009'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 6
 WHERE Code = 'VIEW_MENU_G0009' AND ShortCut = 'G0009'
 END

GO

-- VIEW_MENU_G0010
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0010'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 7
 WHERE Code = 'VIEW_MENU_G0010' AND ShortCut = 'G0010'
 END

GO


-- VIEW_MENU_G0013
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0013'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 8
 WHERE Code = 'VIEW_MENU_G0013' AND ShortCut = 'G0013'
 END

GO

-- VIEW_MENU_G0015
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 9
 WHERE Code = 'VIEW_MENU_G0015' AND ShortCut = 'G0015'
 END

GO

-- VIEW_MENU_G0019
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0019'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 10
 WHERE Code = 'VIEW_MENU_G0019' AND ShortCut = 'G0019'
 END

GO
-- VIEW_MENU_G0041
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0041'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 11
 WHERE Code = 'VIEW_MENU_G0041' AND ShortCut = 'G0041'
 END

GO

-- VIEW_MENU_G0043
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0043'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 12
 WHERE Code = 'VIEW_MENU_G0043' AND ShortCut = 'G0043'
 END

GO

-- VIEW_MENU_G0050
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0050'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 13
 WHERE Code = 'VIEW_MENU_G0050' AND ShortCut = 'G0050'
 END

GO

-- VIEW_MENU_G0099
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0099'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 14
 WHERE Code = 'VIEW_MENU_G0099' AND ShortCut = 'G0099'
 END

GO

-- VIEW_MENU_G0138
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0138'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0138'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 0
 WHERE Code = 'VIEW_MENU_G0138' AND ShortCut = 'G0138'
 END

GO

-- VIEW_MENU_G0140
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0140'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0140'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 1
 WHERE Code = 'VIEW_MENU_G0140' AND ShortCut = 'G0140'
 END

GO

-- VIEW_MENU_G0141
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0141'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0141'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 2
 WHERE Code = 'VIEW_MENU_G0141' AND ShortCut = 'G0141'
 END

GO

-- VIEW_MENU_G0142
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0142'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0142'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 3
 WHERE Code = 'VIEW_MENU_G0142' AND ShortCut = 'G0142'
 END

GO

-- VIEW_MENU_G0143
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0143'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0143'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 4
 WHERE Code = 'VIEW_MENU_G0143' AND ShortCut = 'G0143'
 END

GO

-- VIEW_MENU_G0145
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0145'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0145'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 5
 WHERE Code = 'VIEW_MENU_G0145' AND ShortCut = 'G0145'
 END

GO

-- VIEW_MENU_G0147
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0147'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0147'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 6
 WHERE Code = 'VIEW_MENU_G0147' AND ShortCut = 'G0147'
 END

GO

-- VIEW_MENU_G0148
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0148'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0148'
			)
)
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 7
 WHERE Code = 'VIEW_MENU_G0148' AND ShortCut = 'G0148'
 END

GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
		AND [NAME] = 'MULTITREE' 
			AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN

	INSERT INTO TBLPrefs (
		IDUser,
		IDScreen, 
		[Name], 
		[Preference]
	) 
	VALUES (
		(SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
		'MULTITREE',
		'1'
	)
END
GO


