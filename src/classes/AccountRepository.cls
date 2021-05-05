
public virtual class AccountRepository extends AbstractRepository {

    public Account findOne (String id) {

        return [SELECT Id, Name, AccountNumber, Type, RecordtypeId
                FROM Account WHERE Id = :id];

    }

    public static Database.QueryLocator findAccountsToInactivate() {
        return Database.getQueryLocator([SELECT Id, Inactive__c FROM Account]);
    }



}