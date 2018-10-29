/*
 * Created by Luis on 23/10/2018.
 */
public class ProductController {

	@AuraEnabled
	public static List<Product2> getProducts(){

		/*System.debug('limits'+limits);
		System.debug('offsets'+offsets);

		Integer intlimits = integer.valueof(limits);
		Integer intoffsets = integer.valueof(offsets);*/

		List<Product2> productlst = [Select Id,Name,Family,ProductCode,ISBN__c,Codigo_SAP__c,IsActive from Product2];
		return productlst;
	}

	@AuraEnabled
	public static List<Product2> findProductsByName(String searchKey, Product2[] productList) {
		Set<Id> recordIds = new Map<Id, Product2>(getProducts()).keySet();
		system.debug('PRODUCT LIST' + productList);
		String name = '%' + searchKey + '%';

		return [Select Id,Name,Family,ProductCode,ISBN__c,Codigo_SAP__c,IsActive FROM
				Product2 WHERE (Name LIKE :name OR ISBN__c LIKE :name OR Codigo_SAP__c LIKE :name) AND Id IN:recordIds];
	}

	@AuraEnabled
	public static boolean construirPedido(List<Product2> editedProductList, string accountId){

		 System.debug('###Listado de productos###'+editedProductList);
		 System.debug('###AccountId###'+accountId);
		//Aquí iría la lógica de generar X productos y asignárselos a un order y un Account
		 return true;
		/*try{
			update editedAccountList;
			return true;
		} catch(Exception e){
			return false;
		}*/
	}



	@AuraEnabled
	public static Integer getTotalCount(){
		AggregateResult results = [select  count(Id) total  from Product2 ];
		Integer total =(Integer)results.get('total') ;
		return total;
	}

}