trigger CaseTrigger on Case (before insert,before update,before delete,
							 after insert,after update,after delete,after undelete) {

	// Create an instance of the helper class
	CaseTriggerHandler helper = new CaseTriggerHandler();

	// Even though this trigger only works after insert or after update currently,
	// there is nothing to stop you from adding to it in the future. Adding this
	// logic will allow you to expand in the future.
	//
		//ON AFTER INSERT
		if (Trigger.isAfter && Trigger.isInsert) {
			//helper.onAfterInsert(Trigger.new, Trigger.newMap);
		}

		 //ON AFTER UPDATE
		else if (Trigger.isAfter && Trigger.isUpdate) {
			helper.onAfterUpdate(Trigger.new, Trigger.oldMap);
		}

}