({
    getProducts : function(component, event, helper) {
        var action = component.get("c.getProducts");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },

    findByName: function(component,event) {
        var searchKey = event.getParam("searchKey");
        var productList = component.get("v.data");
        var action = component.get("c.findProductsByName");
        action.setParams({
          "searchKey": searchKey,
          "productList" : productList
        });
        action.setCallback(this, function(a) {
            component.set("v.data", a.getReturnValue());
            //component.set("v.accountsLength", a.getReturnValue().length);
        });
        $A.enqueueAction(action);
    },

    /*
     * This function get called when user clicks on Save button
     * user can get all modified records
     * and pass them back to server side controller
     * */
    saveDataTable : function(component, event, helper) {
        var editedRecords =  component.find("productDataTable").get("v.draftValues");
        var totalRecordEdited = editedRecords.length;
        var action = component.get("c.construirPedido");
        action.setParams({
            'editedProductList' : editedRecords,
            'accountId' : component.get("v.accountId")
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //if update is successful
                if(response.getReturnValue() === true){
                    helper.showToast({
                        "title": "Record Update",
                        "type": "success",
                        "message": totalRecordEdited+" Pedido contruido correctamente."
                    });
                    helper.reloadDataTable();
                } else{ //if update got failed
                    helper.showToast({
                        "title": "Error!!",
                        "type": "error",
                        "message": "Error en la creación del pedido"
                    });
                }
            }
        });
        $A.enqueueAction(action);
    },

    /*
     * Show toast with provided params
     * */
    showToast : function(params){
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams(params);
            toastEvent.fire();
        } else{
            alert(params.message);
        }
    },

    /*
     * reload data table
     * */
    reloadDataTable : function(){
    var refreshEvent = $A.get("e.force:refreshView");
        if(refreshEvent){
            refreshEvent.fire();
        }
    },
})