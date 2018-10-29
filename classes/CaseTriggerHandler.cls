/*
 * Created by Luis on 26/09/2018.
 */
public class CaseTriggerHandler {

	public void onAfterUpdate(List<Case> lstCaseNew, map<id,Case> mapCaseOld){

		for( Case objCase : lstCaseNew ){
			if (mapCaseOld.get(objCase.Id).Informe_Tecnico__c != objCase.Informe_Tecnico__c && objCase.Informe_Tecnico__c == 'Reabierto Manual'){
				System.debug('Está entrando al Trigger AfterUpdate y cumple la condición');
				System.debug('Llama a manageIbercajaCases');
				manageIbercajaCases(objCase.Id_Ibercaja__c,objCase.Informe_Tecnico__c,ObjCase.LastModifiedDate,'8');
			}
		}
	}

	@future(callout=true)
	public static void manageIbercajaCases( String IberCajaCase, String InformeTecnico, Datetime ultimamod, String accion ) {

		dts_ggi_incidencia_modificacion.Modificacion_DTSSoap incidencia = new dts_ggi_incidencia_modificacion.Modificacion_DTSSoap();

		dts_ggi_incidencia_modificacion.OutputIncidencia respuesta = new dts_ggi_incidencia_modificacion.OutputIncidencia();

		respuesta = incidencia.Reanudar_Incidencia(IberCajaCase,InformeTecnico,ultimamod,accion);

		System.debug('Respuesta WebService'+respuesta);

	}

}