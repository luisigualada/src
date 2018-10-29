({
    /*
     * This finction defined column header
     * and calls getAccounts helper method for column data
     * editable:'true' will make the column editable
     * */
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', editable:'false', type: 'text'},
            {label: 'Family', fieldName: 'Family', editable:'false', type: 'text'},
            {label: 'ProductCode', fieldName: 'ProductCode', editable:'false', type: 'text'},
            {label: 'ISBN', fieldName: 'ISBN__c', editable:'false', type: 'text'},
            {label: 'Codigo SAP', fieldName: 'Codigo_SAP__c', editable:'false', type: 'text'},
            {label: 'Activo', fieldName: 'IsActive', editable:'false', type: 'boolean'},
            {label: 'Cantidad', fieldName: 'Cantidad__c', editable:'true', type: 'text'}
        ]);
        helper.getProducts(component, helper);
    },

    searchKeyChange : function(component, event, helper){
        helper.findByName(component,event);
    },

    /*
     * This function is calling saveDataTable helper function
     * to save modified records
     * */
    onSave : function (component, event, helper) {
        helper.saveDataTable(component, event, helper);
    }
})