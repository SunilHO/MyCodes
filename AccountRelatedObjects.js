import {LightningElement, api,wire } from 'lwc';
import getRelatedObjects from '@salesforce/apex/AccountRelatedObjects.getRelatedObjects';


export default class AccountRelatedObjects extends LightningElement {
    @api recordId;
    AccountRecord;
    AccountColumns = [];
    ContactRecord; 
    ContactColumns = [];

  //getting all the related object records
    @wire(getRelatedObjects,{
        RecordId : '$recordId'
    })relatedObjects({error,data}){
        if(data){
            var accCol = [];
            var contCol = [];
            
         var ChildAccountList =  relatedObjects.ChildAccountList;
         var ContactList =  relatedObjects.ContactList;

         for(let Rec in ChildAccountList[0]){
            accCol.push( { label: Rec, fieldName: Rec});
        }
       //Assigning the columns & data for Child AccountList
       this.AccountColumns = accCol;
       this.AccountRecord = ChildAccountList;

         for(let Rec in ContactList[0]){
                contCol.push( { label: Rec, fieldName: Rec });
            }
          //Assigning the columns & data for Contacts.
           this.ContactColumns = contCol;
           this.ContactRecord = ContactList;

        }
        else if(error){
            console.log('Error Has Been Encountered' + JSON.stringify(error));
        }

    }
}
