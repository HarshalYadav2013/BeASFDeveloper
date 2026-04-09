public with sharing class ChildRecordsController {

    @auraEnabled(cacheable=true)
    public static List<sObject> getRelatedRecords(Id recordId, String childObjectApiName, String fieldList, String lookupFieldApiName, Integer limitSize) {
        String soql = 'SELECT '
         + fieldList + 
         ' FROM ' + 
         childObjectApiName + 
         ' WHERE ' + 
         lookupFieldApiName + 
         ' = :recordId ' + 
         ' LIMIT ' + limitSize;
        return Database.query(soql);
    }  
}