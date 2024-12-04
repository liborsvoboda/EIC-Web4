import {addShortcut} from "../utils/shortcut/index";

export function shortcutMixin(GraphView) {
    GraphView.prototype.initShortcut = function () {
        let eventLayer = this.getEventLayer()[0]
        const shortcutConfig = [
            {
                name: 'copy',
                keyboardShortcut: ['Ctrl+C', 'Meta+C'],
                propagate: false,
                target: eventLayer,
                action: copySelectNodes.bind(this),
            },
            {
                name: 'paste',
                keyboardShortcut: ['Ctrl+V', 'Meta+V'],
                propagate: false,
                target: eventLayer,
                action: pasteNodes.bind(this),
            },
            {
                name: 'selectAll',
                keyboardShortcut: ['Ctrl+A', 'Meta+A'],
                propagate: false,
                target: eventLayer,
                action: selectAll.bind(this),
            },
            {
                name: 'delete',
                keyboardShortcut: ['BackSpace'],
                propagate: false,
                target: eventLayer,
                action: deleteSelectNodes.bind(this),
            },
            {
                name: 'undo',
                keyboardShortcut: ['Ctrl+Z',  'Meta+Z'],
                propagate: false,
                target: eventLayer,
                action: undo.bind(this),
            },
            {
                name: 'redo',
                keyboardShortcut: ['Ctrl+Y',  'Meta+Y'],
                propagate: false,
                target: eventLayer,
                action: redo.bind(this),
            },
            {
                name: 'zoomIn',
                keyboardShortcut: ['Ctrl+equals',  'Meta+equals'],
                propagate: false,
                target: eventLayer,
                action: this.zoomIn.bind(this),
            },
            {
                name: 'zoomOut',
                keyboardShortcut: ['Ctrl+minus',  'Meta+minus'],
                propagate: false,
                target: eventLayer,
                action: this.zoomOut.bind(this),
            },
        ]
        addShortcut(shortcutConfig)
    }

    function undo() {
        if(!this.getEditable()){
            if(process.env.NODE_ENV === 'development'){
                console.warn("getEditable = false，不能进行uodo操作")
            }
            return
        }
        this.dm().getHistoryManager().undo()
    }

    function redo() {
        if(!this.getEditable()){
            if(process.env.NODE_ENV === 'development'){
                console.warn("getEditable = false，不能进行redo操作")
            }
            return
        }
        this.dm().getHistoryManager().redo()
    }

    function copySelectNodes() {
        if(!this.getEditable()){
            if(process.env.NODE_ENV === 'development'){
                console.warn("getEditable = false，不能进行copySelectNodes操作")
            }
            return
        }
        let nodes = this.sm().getSelection()
        if(nodes.length){
            let json = this.getDataModel().serializeNodes(nodes)
            window.localStorage.setItem('sfCopyData',json)
        }
    }

    function pasteNodes(event) {
        if(!this.getEditable()){
            if(process.env.NODE_ENV === 'development'){
                console.warn("getEditable = false，不能进行pastNodes操作")
            }
            return
        }
        let copyData = window.localStorage.getItem('sfCopyData') || '[]'
        let dataModel = this.getDataModel()
        let [nodes, wires] = dataModel.deserializeNodes(copyData)
        let [minX,minY, maxX, maxY] = dataModel.getBoundsOfNodes(nodes)
        if(nodes.length){
            let mouseX = this.getOffsetX()
            let mouseY = this.getOffsetY()
            let dx = mouseX - minX
            let dy = mouseY - minY
            for(let i = 0; i < nodes.length; i++){
                nodes[i].translate(dx, dy)
            }
        }
        let datas = [...nodes,...wires]
        dataModel.add(datas)
        this.sm().clearSelection().setSelection(datas)
    }

    function deleteSelectNodes() {
        if(!this.getEditable()){
            if(process.env.NODE_ENV === 'development'){
                console.warn("getEditable = false，不能进行deleteSelectNodes操作")
            }
            return
        }
        let datas = this.sm().getSelection()
        if(datas && datas.length){
            this.beforeDelete(datas,(d)=>{
                this.getDataModel().remove(d)
            })
        }
    }

    function selectAll() {
        this.sm().selectAll()
    }
}
