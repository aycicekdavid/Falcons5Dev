import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONTRACT_OBJECT from '@salesforce/schema/Contract';
import TYPE_FIELD from '@salesforce/schema/Contract.Type__c';

export default class GetPicklistValuesContract extends LightningElement {

    newRtId;
    renewalRtId;
    error;
    typeOptions = [];
    selectedType;

    @wire(getObjectInfo, {objectApiName: CONTRACT_OBJECT})
    objectInfoHandler({data, error}) {
        if(data) {
            console.log(data);
            this.newRTId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.renewalRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === 'Renewal');
        }
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    @wire(getPicklistValues, {fieldApiName: TYPE_FIELD, recordTypeId: '$renewalRtId'})
    picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.typeOptions = this.picklistGenerator(data);
        }
        if(error) {
            console.log(error);
            this.error = error;
        }
    }

    picklistGenerator(data) {
        return data.values.map(item => ({
            label : item.label,
            value : item.value
        }));
    }


}