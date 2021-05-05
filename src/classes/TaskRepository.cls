public virtual class TaskRepository extends AbstractRepository {

    virtual
    public Task findBydId(String id) {
        return [SELECT Id, Subject, Status, Priority FROM Task WHERE Id = :id];
    }

    virtual
    public Task findBydWhatId(String id) {
        return [SELECT Id, WhatId, Subject, Status, Priority FROM Task WHERE WhatId = :id];
    }

    virtual
    public List<Task> findBydWhatId(Set<id> accountIds) {
        return [SELECT Id, WhatId, Subject, Status, Priority FROM Task WHERE WhatId IN :accountIds AND CreatedDate = LAST_90_DAYS];
    }

}