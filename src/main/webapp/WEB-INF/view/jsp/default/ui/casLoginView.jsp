<jsp:directive.include file="includes/top.jsp" />

<div class="form-box" id="login-box">
	<div class="header">Sign In</div>

	<div id="login">
		<form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
			<c:if test="${not pageContext.request.secure}">
				<div class="callout callout-danger">
					<h4 class="text-center">Non-secure Connection</h4>
					<p>You are currently accessing this page over a non-secure
						connection.</p>
				</div>
			</c:if>
			<form:errors path="*" id="msg" cssClass="callout callout-danger" element="div" htmlEscape="false" />
			<div class="body bg-gray">
				<c:choose>
					<c:when test="${not empty sessionScope.openIdLocalId}">
						<strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
						<input type="hidden" id="username" name="username"
							value="<c:out value="${sessionScope.openIdLocalId}" />" />
					</c:when>
					<c:otherwise>
						<div class="form-group">
							<spring:message code="screen.welcome.label.netid.accesskey"
								var="userNameAccessKey" />
							<form:input placeholder="Email ID" required="required"
								cssClass="required form-control" cssErrorClass="error"
								id="username" size="25" tabindex="1"
								accesskey="${userNameAccessKey}" path="username"
								autocomplete="off" htmlEscape="true" />
						</div>
					</c:otherwise>

				</c:choose>
				<div class="form-group">
					<spring:message code="screen.welcome.label.password.accesskey"
						var="passwordAccessKey" />
					<form:password placeholder="Password" required="required"
						cssClass="required form-control" cssErrorClass="error"
						id="password" size="25" tabindex="2" path="password"
						accesskey="${passwordAccessKey}" htmlEscape="true"
						autocomplete="off" />
				</div>
			</div>
			<div class="footer">
				<input type="hidden" name="lt" value="${loginTicket}" /> <input
					type="hidden" name="execution" value="${flowExecutionKey}" /> <input
					type="hidden" name="_eventId" value="submit" /> <input
					accesskey="l" type="submit" name="submit"
					class="btn btn-default orange-btn  btn-block" value="Sign me in" />
			</div>

		</form:form>
	</div>