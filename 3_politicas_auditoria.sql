/* POLITICA DE AUDITORIA para login */
/*--------------------------------------------------*/

CREATE AUDIT POLICY loginPolicy 
ACTIONS LOGON;

audit policy loginPolicy whenever not successful;
audit policy loginPolicy whenever successful;

select * from unified_audit_trail where unified_audit_policies like '%LOGINPOLICY%';
