public virtual class OpportunityRepository extends AbstractRepository {

    virtual
    public List<Opportunity> findByAccountId(Set<Id> ids) {
        return [SELECT Id, Name, AccountId FROM Opportunity WHERE Id IN :ids];
    }


    virtual
    public List<Opportunity> findByAccountIdAndWon(Set<Id> ids) {
        return [SELECT Id, Name, AccountId FROM Opportunity WHERE Id IN :ids AND StageName = 'Closed Won' AND LastModifiedDate = LAST_N_DAYS:120];
    }

    virtual
    public List<Opportunity> findByAccountIdAndInNegotiate(Set<Id> ids) {
        return [SELECT Id, Name, AccountId FROM Opportunity WHERE Id IN :ids AND CloseDate >= TODAY];
    }

}