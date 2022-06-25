import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';



export default class GetOpportunityPicklistValue2 extends LightningElement {
    refPetId;
    oppName;
    stageOptions=[];
    typeOptions =[];
    selectedStage;
    selectedType;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    objectInfoHandler({data,error}){
        if(data){
            console.log(data);
           const rtIds = data.recordTypeInfos;
           this.refPetId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === "Refined Petroleum");
          
        }
        if(error){
            console.log('error:', error);
        }
    }

    @wire(getPicklistValues,{fieldApiName: STAGE_FIELD , recordTypeId: "$refPetId"})
    picklistHandlerStage({data,error}){
        if(data){
            console.log(data);
            this.stageOptions = this.picklistGenerator(data);
        } if(error){
            console.log('error:', error);
        }
    }
    @wire(getPicklistValues,{fieldApiName: TYPE_FIELD , recordTypeId: "$refPetId"})
    picklistHandlerType({data,error}){
        if(data){
            console.log(data);
            this.typeOptions = this.picklistGenerator(data);
        }
        if(error){
            console.error(error);
        }
    }

    picklistGenerator(data){
        return data.values.map(item => ({
            label: item.label,
            value:item.value
        }))
    }
    changeHandler(event){
        const targetName = event.target.name;
        if(targetName === "stage"){
            this.selectedStage = event.target.value;
        }
        else{
            this.selectedType = event.target.value;
        }
    }
    nameChangeHandler(event){
        this.oppName = event.target.value;

  }


}