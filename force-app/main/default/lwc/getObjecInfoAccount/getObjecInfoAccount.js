import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class GetObjecInfoAccount extends LightningElement {
    rtId;
    vendorRtId;
    error;
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfoHandler({data, error}) {
        if(data) {
            console.log(data);
            this.rtId = data.defaultRecordTypeId;
            // eslint-disable-next-line vars-on-top
            var rtids = data.recordTypeInfos;
            this.vendorRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === 'Vendor');
            console.log(this.vendorRtId);
        }
        if(error) {
            this.error = error;
        }
    }

}