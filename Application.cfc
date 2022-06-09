<cfcomponent output="false">
    <cfset this.name="cf_tasks">
    <cfset this.sessionManagement = "true" >
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)>
    <cfset This.applicationtimeout=createTimespan(2,0,0,0)> 
    <cfset this.clientManagement="true">
    <cfset this.setClientCookies=true>
    <cfset this.scriptProtect="all">
    <cfset this.ormenabled="true"> 
    <cfset this.datasource="address_book">
    <cfset this.ormSettings = { 
        logsql : true,
        cflocation : ['components/contacts'],
        dbcreate : "none",  
        dialect : "org.hibernate.dialect.MySQL5Dialect",
        datasource : "address_book",
        useDBForMapping : false
    }>

    <!---OnApplicationStart Method--->
    <cffunction name="OnApplicationStart" returntype="boolean" access="public">
        <cfset application.obj=createObject('component','components.results')>
        <cfreturn true>
    </cffunction>

    <!---OnRequestStart Method--->
    <cffunction name="OnRequestStart" returntype="boolean" access="public">
        <cfset this.onApplicationStart()>
        <cfif isDefined('url.logout')>
            <cflocation  url="index.cfm" addtoken="no">
        </cfif>        
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returnType="void" output="false" access="public">
        <cfset session.started = now()>           
    </cffunction>
    
    <!---<cffunction name="onSessionEnd" returntype="void" access="public">
        <cfargument name="sessionScope" type="any" required="true" hint="Session Scope"/>
        <cfdump var="#arguments.sessionScope.dateInitialized# : #now()#"/>        
    </cffunction>--->

</cfcomponent>