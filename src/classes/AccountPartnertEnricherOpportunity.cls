public with sharing class AccountPartnertEnricherOpportunity {

    private OpportunityRepository opportunityRepository;

    public AccountPartnertEnricherOpportunity() {
        this.opportunityRepository = new OpportunityRepository();
    }

    public void validatePartnerAccount(List<Account> accounts) {
        Set<Id> accountIds = new Set<Id>();
        List<Opportunity> opportunities = new List<Opportunity>();
        List<Opportunity> newOpportunities = new List<Opportunity>();
        Map<Id, Opportunity> mapOpportunities = new Map<Id, Opportunity>();
        
        for (Account acc : accounts) {
            Id idRecordId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Partner').getRecordTypeId();
            if (String.isNotEmpty(acc.RecordTypeId) && acc.RecordTypeId == idRecordId) accountIds.add(acc.Id);
        }
        if (accountIds.isEmpty()) return;

        opportunities = opportunityRepository.findByAccountId(accountIds);
        
        if (!opportunities.isEmpty()) {
            for (Opportunity opp : opportunities) {
                mapOpportunities.put(opp.AccountId, opp);
            }
        }

        for(Account acc : accounts) {
            if (mapOpportunities.containsKey(acc.Id)) continue;
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' - opp Parceiro';
            opp.CloseDate = Date.today().addDays(30);
            opp.StageName = 'Qualification';
            opp.AccountId = acc.Id;
            newOpportunities.add(opp);
        }

        if (newOpportunities.isEmpty()) return;
        this.opportunityRepository.save(newOpportunities);
        
    }

}