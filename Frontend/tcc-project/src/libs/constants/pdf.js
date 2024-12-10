import pdfMake, { fonts, vfs } from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
import * as moment from 'moment';
import * as html2canvas from 'html2canvas';
import { UserPreferencesUtil } from 'src/libs/utils/UserPreferences.util';
pdfMake.vfs = pdfFonts.pdfMake.vfs;

//--------------------------------------------------\\
// Print

async function printPdf(params, gridApi, columnApi) {
    console.log("Exporting to PDF...");
    const pdfDefinition = await getPdfDefinition(params, gridApi, columnApi);
    pdfMake.createPdf(pdfDefinition, null, fonts, vfs).print();
}

export default printPdf;

//--------------------------------------------------\\
// Columns definitions
export function getPdfDefinition(
    params,
    agGridApi,
    agGridColumnApi
) {
    const {
        PDF_PAGE_ORITENTATION,
        PDF_HEADER_HEIGHT,
        PDF_ROW_HEIGHT,
        PDF_WITH_CELL_FORMATTING,
        PDF_WITH_HEADER_FILTER,
        PDF_SELECTED_ROWS_ONLY,
        PDF_WITH_FOOTER_PAGE_COUNT,
        PDF_OUTER_BORDER_COLOR,
        PDF_INNER_BORDER_COLOR,
        PDF_HEADER_COLOR,
        PDF_ODD_BKG_COLOR,
        PDF_EVEN_BKG_COLOR,
        PDF_SELECTED_TREEVIEW,
        PDF_LIST_TREEVIEW,
        PDF_DETAILFILTER_TITLE,
        PDF_FILTER,
        PDF_FILTER_TITLE,
        TRANSLATE,
        DATAFILTER,
        PDF_REPORTCODE,
        PDF_GRAPHIC,
        PDF_TABLE_GRAPHIC,
    } = params;

    return (async function () {
        const columnGroup = !PDF_GRAPHIC ? getColumnGroups() : [];

        const columns = !PDF_GRAPHIC ? getColumns() : [];

        const widths = !PDF_GRAPHIC ? getColumnsWidths(columns) : [];

        const rows = !PDF_GRAPHIC ? getRows(columns) : [];

        //Defino a construção do corpo do dpf
        const body = columnGroup ? [columnGroup, columns, ...rows] : [columns, ...rows];

        const headerRows = columnGroup ? 2 : 1;

        const filterTitle = { text: PDF_FILTER_TITLE, style: 'title' }

        const detailFilterTitle = { text: PDF_DETAILFILTER_TITLE, style: 'title' };

        const treeViewTitle = { text: "TREE VIEW", style: 'title' };

        //Não vi a necessidade da construção do header.
        const header = null;

        const footer = PDF_WITH_FOOTER_PAGE_COUNT
            ? function (current, pageCount) {
                return {
                    text: current.toString() + " " + TRANSLATE.instant('AG_GRID_LOCALE.inRangeStart') + " " + pageCount,
                    margin: [20]
                }
            } : null;


        const pageMargins = [
            10,
            //Aqui vem o paremetro do header como não defini deixei fixo com o valor de 20.
            20,
            10,
            PDF_WITH_FOOTER_PAGE_COUNT ? 20 : 10,
        ];

        //Verfica se e o header do aggrid que esta sendo mondado ou apenas uma linha.
        const heights = rowIndex => rowIndex < headerRows ? PDF_HEADER_HEIGHT : PDF_ROW_HEIGHT;
        //Defino qual as cores padrões para exibição.
        const fillColor = (rowIndex, node, columnIndex) => {
            if (rowIndex < node.table.headerRows) {
                return PDF_HEADER_COLOR;
            }
            return rowIndex % 2 === 0 ? PDF_ODD_BKG_COLOR : PDF_EVEN_BKG_COLOR;
        };

        //Definições do tamanho das linhas e cor.
        const hLineWidth = (i, node) =>
            i === 0 || i === node.table.body.length ? 1 : 1;

        const vLineWidth = (i, node) =>
            i === 0 || i === node.table.widths.length ? 1 : 0;

        const hLineColor = (i, node) =>
            i === 0 || i === node.table.widths.length
                ? PDF_OUTER_BORDER_COLOR
                : PDF_INNER_BORDER_COLOR;

        const vLineColor = (i, node) =>
            i === 0 || i === node.table.widths.length
                ? PDF_OUTER_BORDER_COLOR
                : PDF_INNER_BORDER_COLOR;

        //Construo a treeview baseado nos itemns selecionados.
        //Verifico o relatorio para não criar a tree view.
        const treview = !VerifyReportCode(PDF_REPORTCODE, PDF_FILTER.filterType) ? null :
            getTreeView(PDF_SELECTED_TREEVIEW, PDF_LIST_TREEVIEW);

        //Constroi o filter conforme o report.
        const filter = constructFilter(PDF_FILTER.filterType, PDF_FILTER.filters);

        //Pego no filterRows o detalhes do filtro para construir no getFilter.
        const detailFilter = getFilter(PDF_WITH_HEADER_FILTER);

        //Aqui onde constuoi o objeto para dividir em colunas a tree view, filtro e detalhes de filtro.
        //Caso não tenho o preenhchimento do checktree a tree view não e apresentada.
        const headerTreeFilters = treview ? [[treeViewTitle, treview], [filterTitle, filter], [detailFilterTitle, detailFilter]] :
            [[filterTitle, filter], [detailFilterTitle, detailFilter]];

        const graphic = await drawImageGraphic();

        //Removo o estilo aplicado para os graficos.
        let div = document.getElementById("printDiv");
        div.classList.remove('print-graphic');

        let image = graphic !== null ? {
            image: graphic,
            width: 821,
            height: 450,
            alignment: 'center'
        } : {}

        console.log('Criando content');
        // Aqui e o corpo do nosso pdf onde defino o que ira conter nele.
        //Se ira apresentar o hearder dos filtros o aggrid com o grafico 
        //a construção de um canvas etc.
        const content = !PDF_GRAPHIC ?
            PDF_TABLE_GRAPHIC ? [
                {
                    columns: headerTreeFilters
                },
                {
                    style: "myPdf",
                    table: {
                        headerRows,
                        widths,
                        body,
                        heights
                    },
                    layout: {
                        fillColor,
                        hLineWidth,
                        vLineWidth,
                        hLineColor,
                        vLineColor
                    },
                },
                image
            ]
                : graphic !== null ? [
                    {
                        columns: headerTreeFilters
                    },
                    {
                        //margin: [20, 20, 20, 20],
                        width: 821,
                        height: 450,
                        image: graphic,
                        alignment: 'center'
                    }
                ] : [
                    {
                        columns: headerTreeFilters
                    },
                    {
                        style: "myPdf",
                        table: {
                            headerRows,
                            widths,
                            body,
                            heights
                        },
                        layout: {
                            fillColor,
                            hLineWidth,
                            vLineWidth,
                            hLineColor,
                            vLineColor
                        },
                    }
                ]
            : [
                {
                    columns: headerTreeFilters
                },
                {
                    //margin: [20, 20, 20, 20],
                    width: 781,
                    height: 400,
                    image: graphic,
                    alignment: 'center'
                }
            ]

        console.log('Criando DocDenition');
        //docDefinition e a estrutara do nosso pdf
        const docDefintion = {
            //Aqui defino qual tipo de orientção o pdf será construido
            pageOrientation: PDF_PAGE_ORITENTATION,
            header,
            footer,
            //Marca d'água
            //watermark: 'PPI-MULTITASK',
            content,
            styles: {
                title:
                {
                    fontSize: 16,
                    bold: true
                },
                myPdf: {
                    margin: [0, 0, 0, 0]
                },
                tableHeader: {
                    bold: true,
                    margin: [0, PDF_HEADER_HEIGHT / 3, 0, 0]
                },
                //Não a necessidade de aplicar estilo para tableCell. Construi automaticamento.
                tableCell: {
                }
            },
            pageMargins
        };

        return docDefintion;
    })();

    function constructFilter(filterType, filter) {

        let columns = [];
        let object = [];

        //Baseado no tipo de filtro crio os filtros genéricos.
        console.log('Criando filtro');
        switch (filterType) {
            case 'isProduction':
                //Realizo o mapiamento dos itens que vou querer no objeto. 
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTSTART'), filter.startDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTEND'), filter.endDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.SHIFT'), filter.shift, filter.shift == null ? 'all' : 'shift'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.SHIFTTEAM'), filter.shiftTeam, filter.shiftTeam == null ? 'all2' : ''));

                columns.push(object);
                break;
            case 'isMovMat':
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTSTART'), DATAFILTER.dtStart, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTEND'), DATAFILTER.dtEnd, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.WAREHOUSE'), DATAFILTER.warehouse, 'warehouse'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.ADDRESS'), DATAFILTER.address, 'address'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.PRODUCTFAMILY'), DATAFILTER.productFamily, 'productFamily'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.PRODUCT'), DATAFILTER.product, 'product'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.LOT'), DATAFILTER.lot, 'lot'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.MOVTYPE'), DATAFILTER.movType, 'movType'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.MOVUN'), DATAFILTER.movUn, 'movUn'));

                columns.push(object);

                break;
            case 'isQuality':
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTSTART'), DATAFILTER.dtStart, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTEND'), DATAFILTER.dtEnd, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.PRODUCT'), DATAFILTER.product !== undefined ? DATAFILTER.product.productName : ' ', 'all'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.LOT'), DATAFILTER.lot !== undefined ? DATAFILTER.lot.lotCode : ' ', 'all'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.RESOURCE'), DATAFILTER.resource !== undefined ? DATAFILTER.resource.name : ' ', 'all'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.MOVUN'), DATAFILTER.movUn !== undefined ? DATAFILTER.movUn.movUnCode : ' ', 'all2'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.WOHD'), DATAFILTER.wohd !== undefined ? DATAFILTER.wohd.code : ' ', 'all2'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.WODET'), DATAFILTER.wohd !== undefined ? DATAFILTER.wodet : ' ', 'all'));

                columns.push(object);
                break;
            case 'isWorkOrder':
                console.log(DATAFILTER);
                object.push(createFilterCell(TRANSLATE.instant('PDF.WOHD'), DATAFILTER.wohdCode, ''));
                object.push(createFilterCell(TRANSLATE.instant('PDF.PRODUCT'), DATAFILTER.productCode, ''));
                object.push(createFilterCell(TRANSLATE.instant('PDF.QTYPREV'), DATAFILTER.wohdTotalQuantity, ''));
                object.push(createFilterCell(TRANSLATE.instant('PDF.STATUS'), DATAFILTER.wohdStatusCode, ''));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTEMIT'), DATAFILTER.startDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTENT'), DATAFILTER.endDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTINITPLAN'), DATAFILTER.planStartDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTENDPLAN'), DATAFILTER.planEndDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTSTATUS'), DATAFILTER.lastChangeStatusDate, 'datetimeHoursFormatter'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.USERSTATUS'), DATAFILTER.userName, ''));

                columns.push(object);
                break;
            case 'isManut':
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTSTART'), filter.startDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.DTEND'), filter.endDate, 'date'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.SHIFT'), filter.shift, filter.shift == null ? 'all' : 'shift'));
                object.push(createFilterCell(TRANSLATE.instant('PDF.SHIFTTEAM'), filter.shiftTeam, filter.shiftTeam == null ? 'all2' : ''));

                columns.push(object);
                break;
        }

        return columns;
    }


    function getColumnGroups() {
        let displayedColumnGroups = agGridColumnApi.getAllDisplayedColumnGroups();
        let isColumnGrouping = displayedColumnGroups.some(col =>
            col.hasOwnProperty("children")
        );

        if (!isColumnGrouping) {
            return null;
        }

        let columnGroups = [];

        displayedColumnGroups.forEach(colGroup => {
            let isColSpanning = colGroup.children.length > 1;
            let numberOfEmptyHeaderCellsToAdd = 0;

            if (isColSpanning) {
                let headerCell = createHeaderCell(colGroup);
                columnGroups.push(headerCell);

                numberOfEmptyHeaderCellsToAdd--;
            }

            for (let i = 0; i < numberOfEmptyHeaderCellsToAdd; i++) {
                columnGroups.push({});
            }
        });

        return columnGroups;
    }

    function getTreeView(checkNode, listNode) {
        console.log('Criando TreeView');
        let ul = [];

        if (checkNode != undefined) {
            //Pego os nó checados e construo a treeview baseado no nivel mais alto até
            // o mais baixo.
            if (checkNode.length > 0) {
                checkNode.forEach((node) => {
                    let obj = [];
                    switch (node.hierarchy) {
                        case 'PLANT': case 0:
                            ul.push(node.title);
                            break;
                        case 'AREA': case 1:
                            node.hierarchy = 1;
                            obj = createNodeChildren(node, listNode[0], 0)[0];
                            ul.push(obj);
                            break;
                        case 'SECTOR': case 2:
                            node.hierarchy = 2;
                            obj = createNodeChildren(node, listNode[0], 0)[0];
                            ul.push(obj);
                            break;
                        case 'MANAGERGRP': case 3:
                            node.hierarchy = 3;
                            obj = createNodeChildren(node, listNode[0], 0)[0];
                            ul.push(obj);
                            break;
                        case 'SUPLEVEL1': case 4:
                            node.hierarchy = 4;
                            obj = createNodeChildren(node, listNode[1], 0)[0];
                            ul.push(obj);
                            break;
                        case 'SUPLEVEL2': case 5:
                            node.hierarchy = 5;
                            obj = createNodeChildren(node, listNode[1], 0)[0];
                            ul.push(obj);
                            break;
                        case 'IDRESOURCE': case 6:
                            node.hierarchy = 6;
                            obj = createNodeChildren(node, listNode[node.selectedVision - 1], 0)[0];
                            ul.push(obj);
                            break;
                    }
                });

                //Mapeio o item para que ele não faça esse tipo de replicação:
                // .PCF (PCF)
                //  |- Area 0
                // .PCF (PCF)
                //  |- Area 1
                // ----------------------
                //Para ficar desse modo:
                // .PCF (PCF)
                //  |- Area 0
                //  |- Area 1
                ul = mapItens(ul);

                return [{ ul: ul }];
            }
        }

        return null;
    }

    function mapItens(ul) {
        console.log('Mapiando Itens');
        return addNode(ul);
    }


    function verifyNode(obj) {
        if (obj.ul != undefined) {
            return true;
        }
        else {
            return false;
        }
    }


    function addNode(object) {
        var node = [];
        var cont = 0;

        object.forEach(obj => {
            if (node.length == 0) {
                if (typeof obj === 'string') {
                    node = [obj, { ul: [] }]
                }
                else {
                    node = [obj[0], { ul: [] }]
                }
            }
            else {
                if (typeof obj === 'string') {
                    if (node[0] !== obj) {
                        node = [node[0], obj, { ul: [] }]
                    }
                }
                else {
                    if (node[0] !== obj[0]) {
                        node = [node[0], obj[0], { ul: [] }]
                    }
                }
            }

            if (obj.length > 1) {
                if (verifyNode(obj[1])) {   //Preciso verificar se uma ramificação já esta criado e utilizar ela para adicionar os filhos.
                    //Verificar se preciso criar o nó.
                    node[node.length - 1].ul.push(addNodeChildren(obj[1], node[node.length - 1].ul));
                }
            }
        });

        return node;
    }

    function addNodeChildren(object, nodePrevious) {

        let node = [];
        let aux = [object.ul];
        //Preciso verificar se o node já foi preenchido.
        aux.forEach(obj => {
            if (nodePrevious !== undefined && nodePrevious.length > 0 && nodePrevious[0].length > 0) {
                //Verifico se o no filho já foi adicionado.
                nodePrevious.forEach(no => {
                    //Verifico a tipagem do item e depois o nome do item
                    if (typeof obj === 'string') {
                        node = no === obj ? no : '';
                    }
                    else {
                        node = no[0] === obj[0] ? no : [];
                    }
                });
            }
            if (node.length == 0) {
                if (typeof obj === 'string') {
                    node = [obj, { ul: [] }]
                } else if (typeof obj === 'object') {
                    node = [obj[0], { ul: [] }]
                }
            }
            else if (node[0]) {
                if (typeof obj === 'string') {
                    if (node[0] !== obj[0]) {
                        node = [node[0], obj, { ul: [] }]
                    }

                } else if (typeof obj === 'object') {
                    if (node[0] !== obj[0]) {
                        node = [node[0], obj[0], { ul: [] }]
                    }
                }
            }
            if (typeof obj === 'object') {
                if (obj.length > 1) {
                    if (verifyNode(obj[1])) {
                        if (nodePrevious !== undefined) {
                            let nodePrev = nodePrevious.filter(x => x[0] === obj[0])[0];

                            if (nodePrev !== undefined) {
                                node[node.length - 1].ul.push(addNodeChildren(obj[1], nodePrev[1].ul));
                            } else {
                                if (node[1] === undefined) {
                                    node[1] = { ul: [] };
                                }
                                node[node.length - 1].ul.push(addNodeChildren(obj[1]));
                            }
                        }
                        else {
                            node[node.length - 1].ul.push(addNodeChildren(obj[1]));
                        }
                    }
                }
            }
        });

        return node;
    }

    function createNodeChildren(checkNode, listNode, level) {
        let ul = [];

        //Pega a lista da treeview para construir o nivel.
        //Utilizo da recursividade para realizar esse processo.
        listNode.forEach(obj => {
            let no = [];
            switch (level) {
                case 0:
                    if (checkNode.hierarchy == 0) {
                        if (obj.key == checkNode.key) {
                            ul.push([obj.title]);
                        }
                    }
                    else {
                        let a = createNodeChildren(checkNode, obj.children, 1)[0];
                        if (a != undefined) {
                            ul.push([obj.title, { ul: a }]);
                        }
                    }
                    break;
                case 1:
                    if (checkNode.hierarchy == 1 || checkNode.hierarchy == 4) {
                        if (obj.key == checkNode.key) {
                            ul.push([obj.title]);
                        }
                    }
                    else {
                        if (!obj.isConsolidatedPeriodHeader) {
                            let a = createNodeChildren(checkNode, obj.children, 2)[0];
                            if (a != undefined) {
                                ul.push([obj.title, { ul: a }]);
                            }
                        }
                    }
                    break;
                case 2:
                    if (checkNode.hierarchy == 2 || checkNode.hierarchy == 5) {
                        if (obj.key == checkNode.key) {
                            ul.push([obj.title]);
                        }
                    }
                    else {
                        if (!obj.isConsolidatedPeriodHeader) {
                            if (checkNode.selectedVision == 1) {
                                let a = createNodeChildren(checkNode, obj.children, 3)[0];
                                if (a != undefined) {
                                    ul.push([obj.title, { ul: a }]);
                                }
                            }
                            else {
                                let a = createNodeChildren(checkNode, obj.children, 4)[0];
                                if (a != undefined) {
                                    ul.push([obj.title, { ul: a }]);
                                }
                            }
                        }
                    }
                    break;
                case 3:
                    if (checkNode.hierarchy == 3) {
                        if (obj.key == checkNode.key) {
                            ul.push([obj.title]);
                        }
                    }
                    else {
                        if (!obj.isConsolidatedPeriodHeader) {
                            let a = createNodeChildren(checkNode, obj.children, 4)[0];
                            if (a != undefined) {
                                ul.push([obj.title, { ul: a }]);
                            }
                        }
                    }
                    break;
                case 4:
                    if (obj.key == checkNode.key) {
                        ul.push([obj.title]);
                    }
                    break;
            }
        });

        return ul;
    }

    function getFilter(object) {
        //A definição esta como columns para retorna o valor
        //para o objeto columns do pdf no content.
        let columns = [];

        object.forEach(obj => {
            if (obj.hidden === 0) {
                let columnCell = createColumnCell(obj);
                columns.push(columnCell);
            }
        })

        return columns;
    }

    function getColumns() {
        let columns = [];
        agGridColumnApi.getAllDisplayedColumns().forEach(col => {
            let headerCell = createHeaderCell(col);
            columns.push(headerCell);
        });
        return columns;
    }

    function getRows(columns) {
        let rows = [];
        agGridApi.forEachNodeAfterFilterAndSort(node => {
            if (PDF_SELECTED_ROWS_ONLY && !node.isSeleceted()) {
                return;
            }
            let row = columns.map((col) => {
                if (!col.pivot) {
                    let cellValue;
                    var value = agGridApi.getValue(col.colId, node);
                    switch (col.valueFormatterColumn) {
                        case "tempFormatter":
                            var pref = UserPreferencesUtil.getLocalStorage().find(
                                (i) => i.code === 'FORMATTIME'
                            ).value
                            if (value || !value == 0 || !value === '0001-01-01T00:00:00') {
                                if (pref == 1) {
                                    var horas = Math.floor(value / 3600);
                                    var minutos = Math.floor((value % 3600) / 60);
                                    var segundos = value % 60;
                                    value = `${horas.toString()}:${minutos.toString().padStart(2, '0')}:${segundos.toString().padStart(2, '0')}`;
                                } else {
                                    var horas = value / 3600;

                                    if (UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value == 'COMMA')
                                        value = horas.toFixed(2).toString().padStart(2, '0').replace('.', ',');
                                    else
                                        value = horas.toFixed(2).toString().padStart(2, '0').replace(',', '.');

                                }
                            }
                            cellValue = value

                            break;
                        case "dateFormatter":
                            if (value && value != 0 && value != '0001-01-01T00:00:00')
                                cellValue = moment(value).locale(navigator.language).format("L");
                            break;
                        default:
                            cellValue = agGridApi.getValue(col.colId, node);
                            break;
                    }

                    let tableCell = createTableCell(cellValue, col.valueFormatterColumn, col.colId);
                    return tableCell;
                }
            });
            rows.push(row);
        });

        return rows;
    }

    function getColumnsWidths(columns) {
        return columns.map(() => 100 / columns.length + "%");
    }

    function createFilterCell(name, value, type) {
        let filterCell = {};

        if (typeof value === 'string') {
            filterCell = value != null && value !== '' ? { text: name + ' : ' + formatterData(type, value, name) } : '*';
        }
        else if (typeof value === 'number') {
            filterCell = value != null ? { text: name + ' : ' + formatterData(type, value, name) } : '*';
        }
        else if (typeof value === 'object') {
            let text = "";

            if (value != null && value.length > 0) {
                for (let i = 0; i < value.length; i++) {
                    if (value[i] === 0) {
                        text += formatterData(type, value[i], name);
                    }
                    else
                        if (i == value.length - 1) {
                            text += formatterData(type, value[i], name);
                        } else {
                            text += formatterData(type, value[i], name) + ', ';
                        }
                }

                if (text == "") {
                    text = 'test'
                }

                filterCell = { text: name + ' : ' + text };
            }
            else {
                filterCell = { text: name + ' : ' + formatterData(type, value, name) };
            }

        }

        return filterCell;
    }

    function createColumnCell(col) {
        let columnCell = {};

        //Verifico qual e o tipo do detalhe do filtro para adiciona um text ao pdf com o valor
        if (col.type == "text") {
            //Não adiciono ao columnCell caso não tenha um valor preenchido.
            if (col.options[0].value != undefined && col.options[0].value != "") {
                columnCell = { text: col.label + ' : ' + col.options[0].value };
            }
        } else if (col.type == "checkbox") {
            let checkboxSelect = col.options.filter(x => x.value == 'true');

            let text = "";

            for (let i = 0; i < checkboxSelect.length; i++) {
                if (i == checkboxSelect.length - 1) {
                    text += checkboxSelect[i].label;
                } else {
                    text += checkboxSelect[i].label + ', ';
                }
            }

            if (text == "") {
                text = 'Não foi marcado nenhum checkbox'
            }

            columnCell = { text: col.label + ' : ' + text };
        } else if (col.type == "radio") {
            let radioSelect = col.options.filter(x => x.value == 'true')[0];
            columnCell = { text: col.label + ' : ' + radioSelect.label };
        } else if (col.type == 'timeSelectFilter') {
            let timeSelectFilter = col.options.filter(x => x.startTime != null)[0];
            if (timeSelectFilter != undefined && timeSelectFilter != null) {
                columnCell = { text: col.label + ' : ' + timeSelectFilter.startTime };
            }
        }

        return columnCell;
    }

    function createHeaderCell(col) {
        let headerCell = {};

        let isColGroup = col.hasOwnProperty("children");

        if (isColGroup) {
            headerCell.text = col.originalColumnsGroup.colGroupDef.headerName;
            headerCell.colSpan = col.children.length;
            headerCell.colId = col.groupId;
        } else {
            let headerName = col.colDef.headerName;

            if (col.sort) {
                headerName += ``; // (${col.sort})
            }
            if (col.filterActive) {
                headerName += ``;//[FILTERING]
            }

            if (col.colDef.showRowGroup) {
                let group = document.getElementsByClassName('ag-column-drop-list ag-column-drop-horizontal-list')[0];

                headerName += ' ( ';
                group.childNodes.forEach((span, index) => {
                    if (index % 2 == 0) {
                        if (group.childNodes.length - 1 == index) {
                            headerName += span.childNodes[3].innerHTML;
                        } else {
                            headerName += span.childNodes[3].innerHTML + " -> ";
                        }
                    }
                })
                headerName += ' )';
            }

            headerCell.text = headerName;
            headerCell.colId = col.getColId();
            headerCell.valueFormatterColumn = col.colDef.valueFormatterColumn;
        }

        headerCell["style"] = "tableHeader";

        return headerCell;
    }

    function createTableCell(cellValue, type, coldId) {

        const tableCell = {
            text: cellValue !== undefined ? formatterData(type, cellValue, '') : "",
            style: "tableCell"
        }

        return tableCell;
    }

    function formatterData(type, v, name) {
        switch (type) {
            case '':
                return v;
            case 'intFormatter':
                return parseInt(v);
            case 'timeHoursFormatter':
                let d = moment.duration(v, 'seconds');
                let hour = (Math.floor(d.asHours()) > 0 ? ((Math.floor(d.asHours()) < 10 ? "0" : "") + Math.floor(d.asHours())) : "00");
                let min = (Math.floor(d.minutes()) > 0 ? ((Math.floor(d.minutes()) < 10 ? "0" : "") + Math.floor(d.minutes())) : "00");
                let sec = (Math.floor(d.seconds()) > 0 ? ((Math.floor(d.seconds()) < 10 ? "0" : "") + Math.floor(d.seconds())) : "00");

                return hour + ":" + min + ":" + sec;
            case 'date':
                return v !== null ? moment(v).format('DD/MM/YYYY') : '*';
            case 'dec2Formatter':
                return v.value == undefined ? v.toFixed(2) : v.value.toFixed(2);
            case 'dec4Formatter':
                return v.toFixed(4);
            case 'datetimeHoursFormatter':
                return moment(v).format('DD/MM/YYYY HH:mm:ss');
            case 'shift':
                switch (v) {
                    case 100:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_ALL');
                    case 0:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_0');
                    case 1:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_1');
                    case -1:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-1');
                    case -10:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-10');
                    case 2:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_2');
                    case -20:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-20');
                    case 3:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_3');
                    case -30:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-30');
                    case 4:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_4');
                    case -40:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-40');
                    case 5:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_5');
                    case -50:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-50');
                    case 6:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_6');
                    case -60:
                        return TRANSLATE.instant('GLOBAL.VIEW_GLOBAL_SHIFT_-60');
                }
                break;
            case 'all':
                return (v === undefined || v === " " || v === null) ? TRANSLATE.instant('PDF.ALL') + name : v;
            case 'all2':
                return (v === undefined || v === " " || v === null) ? TRANSLATE.instant('PDF.ALL2') + name : v;
            case '*':
                return v !== null ? v : '*';
            case 'warehouse':
                return (v !== undefined && v !== " " && v !== null && v.warehouseCode !== undefined) ? v.warehouseCode + '-' + v.warehouseName : TRANSLATE.instant('PDF.ALL') + name;
            case 'product':
                return (v !== undefined && v !== " " && v !== null && v.productName !== undefined) ? v.productName : TRANSLATE.instant('PDF.ALL') + name;
            case 'lot':
                return (v !== undefined && v !== " " && v !== null && v.lotCode !== undefined) ? v.lotCode : TRANSLATE.instant('PDF.ALL') + name;
            case 'address':
                return (v !== undefined && v !== " " && v !== null && v.addressName !== undefined) ? v.addressName : TRANSLATE.instant('PDF.ALL') + name;
            case 'movUn':
                return (v !== undefined && v !== " " && v !== null && v.movUnCode !== undefined) ? v.movUnCode : TRANSLATE.instant('PDF.ALL2') + name;
            case 'movType':
                return (v !== undefined && v !== " " && v !== null && v.movTypeName !== undefined) ? v.movTypeName : TRANSLATE.instant('PDF.ALL') + name;
            case 'productFamily':
                return (v !== undefined && v !== " " && v !== null && v.productFamilyName !== undefined) ? v.productFamilyName : TRANSLATE.instant('PDF.ALL2') + name;
            default:
                return v;
        }
    }

    function getPdfExportOptions(colId) {
        let col = agGridColumnApi.getColumn(colId);
        return col.coldDef.pdfExportOptions;
    }

    function VerifyReportCode(reportCode, filterType) {
        console.log('Verificando apresentação da TreeView');
        if (reportCode == 'G0150' ||
            reportCode == 'G0151' ||
            reportCode == 'G0152' ||
            reportCode == 'G0153' ||
            reportCode == 'G0154' ||
            reportCode == 'G0155' ||
            reportCode == 'G0156' ||
            reportCode == 'G0157') {
            return false;
        }

        if (filterType == 'isWorkOrder' || filterType == 'isQuality' || filterType == 'isMovMat') {
            return false;
        }

        return true;
    }

    async function drawImageGraphic() {
        if (PDF_GRAPHIC) {
            if (document.getElementsByTagName('app-multiview-line-chart').length != 0) {
                let canvas = document.getElementsByTagName('canvas');
                return canvas[0].toDataURL();
            }
            let elementoHTML  = document.getElementById('printDiv');
            const canvas = await html2canvas.default(elementoHTML);
            return canvas.toDataURL();
        }
        else {
            let canvas = document.getElementsByTagName('canvas');
            if (canvas != undefined && canvas.length != 0) {
                if (canvas.length > 1) {
                    return canvas[1].toDataURL();
                }
                return canvas[0].toDataURL();
            }
            return null;
        }
    }

}

