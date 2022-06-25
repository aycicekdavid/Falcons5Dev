import { LightningElement } from 'lwc';

export default class FamousPeople extends LightningElement {
    contacts = [
        {name:"Jeff Bezos", title:"Exexutive Chairman", company:"Amazon", stay:"USA"},
        {name:"Sundar Pichai", title:"CEO", company:"Google", stay:"USA"},
        {name:"Tim Cook", title:"CEO", company:"Apple", stay:"USA"},
        {name:"Mark Zuckenberg", title:"CEO", company:"Facebook", stay:"USA"},
    ];
}