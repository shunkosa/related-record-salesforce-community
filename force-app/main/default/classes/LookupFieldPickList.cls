global class LookupFieldPickList extends VisualEditor.DynamicPickList {
    VisualEditor.DesignTimePageContext context;

    global LookupFieldPickList(VisualEditor.DesignTimePageContext context) {
        this.context = context;
    }

    
    global override VisualEditor.DataRow getDefaultValue() {
        return getValues().get(0);
    }    

    global override VisualEditor.DynamicPickListRows getValues(){
        System.debug(context.entityName);
        Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(context.entityName).getDescribe().fields.getMap();
        VisualEditor.DynamicPickListRows picklist = new VisualEditor.DynamicPickListRows();
        for(String key : fieldMap.keySet()) {
            Schema.DescribeFieldResult fieldResult = fieldMap.get(key).getDescribe();
            if(fieldResult.getType().equals(Schema.DisplayType.REFERENCE)
                && !fieldResult.getReferenceTo().contains(Schema.SObjectType.User.getSObjectType())) {
                picklist.addRow(new VisualEditor.DataRow(fieldResult.getLabel(), fieldResult.getName()));
            }
        }
        return picklist;
    }
}
