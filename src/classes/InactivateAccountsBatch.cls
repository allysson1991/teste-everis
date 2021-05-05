global class InactivateAccountsBatch implements Database.Batchable<sObject> {

     global Database.QueryLocator start(Database.BatchableContext BC) {
		return AccountRepository.findAccountsToInactivate ();
    }
    
    global void execute(Database.BatchableContext bc, List<Account> records){
        InactivateAccounts.inactivate(records);
    }    

    global void finish(Database.BatchableContext bc){
        System.debug('Batch finalizado');
    } 

}