@isTest
public class AccountManagerControllerTest 
{
	public static testmethod void myUnitTest()
    {
        Account objAcc = new Account();
        objAcc.Name = 'TestAccount';
        insert objAcc;
        system.assertNotEquals( objAcc.Id, null );
        
        ApexPages.StandardController sc = new ApexPages.StandardController(objAcc);
        AccountManagerController.StrFieldSetname = 'PRNV_1__FirstAccountManager';
		AccountManagerController testController = new AccountManagerController(sc); 
        AccountManagerController.StrFieldSetname = 'PRNV_1__FirstAccountManagerrr';
        testController = new AccountManagerController(sc);
    }
}