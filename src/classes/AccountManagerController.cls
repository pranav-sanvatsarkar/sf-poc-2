public class AccountManagerController 
{
    public set<String> LstFieldAPINames { get; set; }
    public static string StrFieldSetname { get; set; }
    public Account sObj { get; set; }
	public AccountManagerController( ApexPages.StandardController controller )
	{
        try
    	{
	        LstFieldAPINames = new set<String>();
            Account objAcc = new Account();
            sObj = objAcc;
			List<Schema.FieldSetMember> lstFldStMmbrs = new List<Schema.FieldSetMember>(); 
	        if( StrFieldSetname == null )
	        	lstFldStMmbrs = Schema.getGlobalDescribe().get('Account').getDescribe().FieldSets.getMap().get('admin_201_1__FirstAccountManager').getFields();
        	else
        		lstFldStMmbrs = Schema.getGlobalDescribe().get('Account').getDescribe().FieldSets.getMap().get(StrFieldSetname).getFields();
            Set<String> strFields = new Set<String>();
            for( Schema.SObjectField field :  Schema.getGlobalDescribe().get('Account').getdescribe().fields.getMap().values() )
                strFields.add(field.getDescribe().getName());
            //system.debug('Fields' + Schema.getGlobalDescribe().get('Account').getDescribe().fields());
	        for( Schema.FieldSetMember field : lstFldStMmbrs )
            {
                String strFieldAPIName = null;
                for( String fieldAPIName : strFields )
                {
                    /*
					if( field.getFieldPath() == fieldAPIName )
                    {
						if( fieldAPIName == 'BillingCountry' )
                            strFieldAPIName = 'BillingCountryCode';
                        else if( fieldAPIName == 'ShippingCountry' )
                            strFieldAPIName = 'ShippingCountryCode';
                        else if( fieldAPIName == 'BillingState' )
                            strFieldAPIName = 'BillingStateCode';
                        else if( fieldAPIName == 'ShippingState' )
                            strFieldAPIName = 'ShippingStateCode';
                        else
                            strFieldAPIName = fieldAPIName;
                    }
*/
                }
                LstFieldAPINames.add(field.getFieldPath());   
            }
    	}
    	catch( Exception ex )
    	{
    		system.debug( 'Exception: ' + ex );
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Exception: ' + ex.getMessage() + '; at line number: ' + ex.getLineNumber()));
    	}
    }
}