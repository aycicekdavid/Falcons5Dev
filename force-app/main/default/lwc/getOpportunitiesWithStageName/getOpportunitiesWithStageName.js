import { LightningElement, wire } from 'lwc';
import getOppsByStageName from '@salesforce/apex/OpportunityController.getOppsByStageName';

const COLUMNS = [
    {label:"Opportunity Name", fieldName: "Name", type: "text"},
    {label:"Amount", fieldName: "Amount", type: "currency"},
    {label:"Stage", fieldName: "StageName", type: "text"},
    {label:"Type", fieldName: "Type", type: "text"},
];

export default class GetOpportunitiesWithStageName extends LightningElement {
    
    stageName = 'Closed Won';
    @wire (getOppsByStageName, {stage: '$stageName'})
    opportunities;
    columns = COLUMNS;
}