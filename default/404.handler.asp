<%
select case lcase(aspl.pathinfo)

	case "customurl" 	: aspL("default/asp/404/default.asp")
	
	case "learn-more" 	: aspL("default/asp/404/learnmore.asp")	
	
	case "about" 		: aspL("default/asp/404/about.asp")	
	
	case "getcode" 		: aspL("default/asp/404/getcode.asp")	
	
	case "contact" 		: aspL("default/asp/404/contact.asp")	
	
	case else 'do nothing?
	
end select
%>