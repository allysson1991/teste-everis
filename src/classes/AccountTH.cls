public with sharing class AccountTH extends TriggerHandler{

    private List<Account> newRecords;
    private Map<Id, Account> oldRecordsById;
    private AccountTHService service;
    private AccountPartnertEnricherOpportunity accountPartnertEnricherOpportunity;
    private AccountTask accountTask;


	public AccountTH() {
        this ( (List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap );
    }

	public AccountTH ( List<Account> newRecords, Map<Id, Account> oldRecordsById ) {
        this.newRecords = newRecords;
        this.oldRecordsById = oldRecordsById;
        this.service = new AccountTHService();
        this.accountPartnertEnricherOpportunity = new AccountPartnertEnricherOpportunity();
        this.accountTask = new AccountTask();
    }

    override
    public void beforeInsert() {
        this.service.validateAccountNumber(this.newRecords);
    }

    override
    public void beforeUpdate() {
        this.service.validateAccountNumber(this.newRecords);
    }

    override
    public void afterInsert() {
        this.accountPartnertEnricherOpportunity.validatePartnerAccount(this.newRecords);
        this.accountTask.enricAccounthWithTask(this.newRecords);
    }

    override
    public void afterUpdate() {
        this.accountPartnertEnricherOpportunity.validatePartnerAccount(this.newRecords);
    }

}