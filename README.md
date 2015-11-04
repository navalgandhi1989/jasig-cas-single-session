# jasig-cas-single-session 

The project is a customized setup of Jasig Cas (https://wiki.jasig.org/display/CAS/Home). Jasig it self is one of the best implementation if Single Sign On and really handles it in a perfect manner. However, I had a custom requirement of having Single Sign On between applications but yet only one session per user had to be allowed over the web. 
 
Jasig Cas itself uses a in memory map to keep a track of the ticket allotted for the users. I am using a similar approach to achieve the requirement :- 
 
In Order to achieve the functionality, some additional functionalities were added to project. The changes are listed below:- 
 
1. Implementation of "SingleSesionTicketRegistry" class (src/main/java/com/naval/cas/SingleSesionTicketRegistry.java) which maintains the session tickets in a map as a default behavior, but if there is already a ticket for a user in the map, then the registry will invalidate the previous session. 
2. Modification of Cas configuration to use a Mysql Database for authentication where password is MD5 Hashed. 
3. Modification of Cas configuration to use the custom Ticket Registry instead of Default one.


Below are configuration changes which has to be done in project :-
1. src/main/resources/application.properties
	
		#Toggle the feature if Single Session.
    	is.single.sesion.per.user=true

    	#MySQL query to check the authentication.
    	user.authentication.sql=select password from user where email=? and is_active=1  
    
    
2. /src/main/webapp/WEB-INF/spring-configuration/ticketRegistry.xml

		<!--Comment the default ticket regitry. -->
		<!-- <bean id="ticketRegistry" class="org.jasig.cas.ticket.registry.DefaultTicketRegistry" />  -->
    
		<!--Add the custom ticket regitry. -->
		<bean id="ticketRegistry" class="com.naval.cas.SingleSesionTicketRegistry"  
  		p:isSingleSesionPerUser="${is.single.sesion.per.user}"
  		p:logoutManager-ref="logoutManager"/>
    
3. /src/main/webapp/WEB-INF/deployerConfigContext.xml
	
		<!--Add the Following code block -->
		<bean id="passwordEncoder"
		      class="org.jasig.cas.authentication.handler.DefaultPasswordEncoder"
		      c:encodingAlgorithm="MD5"
		      p:characterEncoding="UTF-8" />

		<bean id="primaryAuthenticationHandler"
		      class="org.jasig.cas.adaptors.jdbc.QueryDatabaseAuthenticationHandler"
		      p:dataSource-ref="dataSource"
		      p:passwordEncoder-ref="passwordEncoder"
		      p:sql="${user.authentication.sql}" />

The Database dump is present in the root directory under the name of "DatabaseDump.sql"

