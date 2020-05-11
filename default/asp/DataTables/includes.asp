<%
class cls_contact

	private rs
	public iId, sText, iNumber, dDate, iCountryID	

	public function pick(id)
	
		if aspL.convertNmbr(id)<>0 then	
			
			set rs=db.rs : rs.open ("select * from contact where iId=" & id)
			
			if not rs.eof then
			
				iId			=	rs("iId")
				sText		=	rs("sText")
				iNumber		=	rs("iNumber")				
				dDate		=	rs("dDate")
				iCountryID	=	rs("iCountryID")
			
			end if
					
			set rs=nothing
		
		end if
	
	end function
	
	private function check
	
		check=true
		
		if aspL.isEmpty(sText) then 			check=false : exit function
		if not aspL.isNumber(iNumber) then 		check=false : exit function		
		if not isDate(dDate) then 				check=false : exit function
		if not aspL.isNumber(iCountryID) then 	check=false : exit function		
	
	end function
	
	public function save
	
		if check then
		
			set rs=db.rs 

			if aspl.isNumber(iId) then
				rs.Open "select * from contact where iId="& aspl.convertNmbr(iId)		
			else
				rs.Open "select * from contact where 1=2"
				rs.AddNew				
			end if		
			
			rs("sText")			= sText
			rs("iNumber")		= aspL.convertNmbr(iNumber)			
			rs("dDate")			= dDate
			rs("iCountryID")	= aspL.convertNmbr(iCountryID)
			
			rs.update()
			
			iId = aspl.convertNmbr(rs("iId"))
			
			rs.close		
			
			set rs=nothing
			
			save=true		
		
		else
		
			save=false
		
		end if
	
	end function
	
	
	public function delete	
		
		db.execute("delete from contact where iId=" & aspl.convertNmbr(iId))
		
	end function


end class

Class cls_countryList
	
	Public list
	private rs
	
	Private Sub Class_Initialize
	
		Set list = aspL.dict		
		
		set rs=db.execute("select * from country")
		
		while not rs.eof
			id=rs("iId")
			name=rs("sText")
			list.Add id, name
			rs.movenext
		wend
		
		set rs = nothing
		
	End Sub
	
	Private Sub Class_Terminate
	
		Set list = nothing
		
	End Sub	
	
End class
%>