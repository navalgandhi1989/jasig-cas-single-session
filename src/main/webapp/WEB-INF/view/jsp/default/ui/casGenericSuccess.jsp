<jsp:directive.include file="includes/top.jsp" />

<div class="form-box" id="login-box">
	<div class="header">Sign In</div>

	<div id="login">
			<c:if test="${not pageContext.request.secure}">
				<div class="callout callout-danger">
					<h4 class="text-center">Non-secure Connection</h4>
					<p>You are currently accessing this page over a non-secure
						connection.</p>
				</div>
			</c:if>
			<div class="callout callout-info"><p><spring:message code="screen.success.success" /></p></div>
			<div class="footer">
					<a href="<%=request.getContextPath()%>/logout" class="btn btn-default orange-btn  btn-block">Logout</a>
			</div>
	</div>
	</div>
