import {LightningElement, api,wire } from 'lwc';
import getRelatedObjects from '@salesforce/apex/AccountRelatedObjects.getRelatedObjects';


export default class AccountRelatedObjects extends LightningElement {
    @api recordId;
    accountRecord;
    accountColumns = [];
    contactRecord; 
    contactColumns = [];

  //getting all the related object records
    @wire(getRelatedObjects,{
        RecordId : '$recordId'
    })relatedObjects({error,data}){
        if(data){
            var accCol = [];
            var contCol = [];
            
         var childAccountList =  relatedObjects.childAccountList;
         var contactList =  relatedObjects.contactList;

         for(let Rec in childAccountList[0]){
            accCol.push( { label: Rec, fieldName: Rec});
        }
       //Assigning the columns & data for Child AccountList
       this.accountColumns = accCol;
       this.accountRecord = childAccountList;

         for(let Rec in contactList[0]){
                contCol.push( { label: Rec, fieldName: Rec });
            }
          //Assigning the columns & data for Contacts.
           this.contactColumns = contCol;
           this.contactRecord = contactList;

        }
        else if(error){
            console.log('Error Has Been Encountered' + JSON.stringify(error));
        }

    }
}
