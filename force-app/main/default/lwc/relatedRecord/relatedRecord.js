import { LightningElement, api } from 'lwc';

export default class RelatedRecord extends LightningElement {
    @api recordId = '{!recordId}';
    @api iconName = 'standard:account';
    @api headerLabel;
    @api lookupField;
    @api updateAction;
}