public with sharing class InactivateAccounts {


    public static void inactivate(List<Account> accounts) {
        OpportunityRepository opportunityRepository = new OpportunityRepository();
        TaskRepository taskRepository = new TaskRepository();
        AccountRepository accountRepository = new AccountRepository();
        List<Task> tasks = new List<Task>();
        List<Account> accountsToInactivate = new List<Account>();
        List<Opportunity> opportunitiesNotClosed = new List<Opportunity>();
        List<Opportunity> opportunitiesWon = new List<Opportunity>();
        Map<String, SObject> mapTasks = new Map<String, SObject>();
        Map<String, SObject> mapOpportunitiesNotClosed = new Map<String, SObject>();
        Map<String, SObject> mapOpportunitiesWon = new Map<String, SObject>();


        Set<Id> accountIds = new Set<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        tasks = taskRepository.findBydWhatId(accountIds);
        opportunitiesNotClosed = opportunityRepository.findByAccountIdAndInNegotiate(accountIds);
        opportunitiesWon = opportunityRepository.findByAccountIdAndWon(accountIds);

        mapTasks = ListHelper.indexListByField('WhatId', opportunitiesNotClosed);
        mapOpportunitiesNotClosed = ListHelper.indexListByField('AccountId', opportunitiesNotClosed);
        mapOpportunitiesWon = ListHelper.indexListByField('AccountId', opportunitiesWon);

        for(Account acc : accounts) {
            if (mapTasks.containsKey(acc.Id)) continue;
            if (mapOpportunitiesNotClosed.containsKey(acc.Id)) continue;
            if (mapOpportunitiesWon.containsKey(acc.Id)) continue;
            acc.Inactive__c = true;
            accountsToInactivate.add(acc);
        }

        if (accountsToInactivate.isEmpty()) return;
        accountRepository.save(accountsToInactivate);

    }

}