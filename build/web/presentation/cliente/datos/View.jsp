<%--
<%@page import="bank.logic.Cliente"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bank.presentation.client.data.Model"%>
<%@page import="bank.logic.Cuenta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Map<String, String> errors =(Map<String,String>) request.getAttribute("errors"); %>
<% Model model = (Model) request.getAttribute("model"); %>
<% Cliente cliente = model.getCliente(); %>
<% Map<String, String[]> credencials = (errors!=null)?request.getParameterMap():getCredencials(model); %>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
 <title>Personal Data</title> 
</head>
<body>
    <%@ include file="/presentation/Header.jsp" %>
    <div class="content">
        <form class="formData" name="form" action="/Banco_PIV/presentation/client/data/update" method="post">
            <header>Informacion Personal</header>
            Nombre
            <input class ="" type="text" name="name" placeholder="Nombre" 
                value="<%= cliente.getNombre() %>" title=""><br>
            Cedula
            <input class ="" type="text" name="id" placeholder="Cedula" 
                value="<%= cliente.getCedula() %>" title=""><br>
            Telefono
            <input class ="" type="text" name="telephone" placeholder="Telefono" 
                value="<%= cliente.getTelefono() %>" title=""><br>
            Usuario
            <input class ="" type="text" name="user" placeholder="Usuario" 
                value="<%= cliente.getUsuario().getIdUsuario() %>" title=""><br>
            Contraseña
            <input class ="" type="text" name="password" placeholder="Contraseña" 
                value="<%= cliente.getUsuario().getPassword()%>" title=""><br>
            
            <footer><input class="buttom" type="submit" value="Actualizar"></footer>
        </div>
        </form>
    </div>
    <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>

<%!
    private String verifyErrors(String name, Map<String,String> errors){
        if(errors!=null && errors.get(name)!=null){ return "invalid"; }
        return "";
        //nombre cedula telefono usuario contraseña
    }
    private String getTittle(String name, Map<String,String> errors){
        if(errors!=null && errors.get(name)!=null){ return errors.get(name); }
        return "";
    }
    
    private Map<String,String[]> getCredencials(Model model){
        Map<String,String[]> credencials = new HashMap<String,String[]>();
        credencials.put("user-name", new String[]{model.getCliente().getCedula()});
        return credencials;
    }
%>
--%>

<%@page import="bank.presentation.client.data.Model"%>
<%@page import="bank.logic.Cliente"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Map<String, String> errors =(Map<String,String>) request.getAttribute("errors"); %>
<% Model model = (Model) request.getAttribute("model"); %>
<% Cliente cliente = model.getClient(); %>
<% Map<String, String[]> credencials = (errors!=null)?request.getParameterMap():getCredencials(model); %>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
 <title>Personal Data</title> 
</head>
<body>
    <%@ include file="/presentation/Header.jsp" %>
    <div class="content">
        <form class="formData" name="form" action="/Banco_PIV/presentation/client/data/update" method="post">
            <header>Informacion Personal</header>
            <label>Cedula&nbsp;&nbsp;<%= cliente.getCedula() %><label><br>
            <label>Nombre</label>
            <input class ="<%=verifyErrors("name",errors)%>" type="text" name="name" placeholder="Nombre" 
                value="<%=credencials.get("name")[0]%>" title="<%=getTittle("name",errors)%>"><br>
            <label>Telefono</label>
            <input class ="<%=verifyErrors("telephone",errors)%>" type="text" name="telephone" placeholder="Telefono" 
                value="<%=credencials.get("telephone")[0]%>" title="<%=getTittle("telephone",errors)%>"><br>
            <label>Usuario</label>
            <input class ="<%=verifyErrors("user-name",errors)%>" type="text" name="user-name" placeholder="Usuario" 
                value="<%=credencials.get("user-name")[0]%>" title="<%=getTittle("user-name",errors)%>"><br>
            <label>Contraseña</label>
            <input class ="<%=verifyErrors("password",errors)%>" type="text" name="password" placeholder="Contraseña" 
                value="<%=credencials.get("password")[0]%>" title="<%=getTittle("password",errors)%>"><br>
            <footer>
                <input class="buttom" type="submit" value="Actualizar">
            </footer>
        </form>
    </div>
    <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>

<%!
    private String verifyErrors(String name, Map<String,String> errors){
        if(errors!=null && errors.get(name)!=null){ return "invalid"; }
        return "";
        //nombre cedula telefono usuario contraseña
    }
    private String getTittle(String name, Map<String,String> errors){
        if(errors!=null && errors.get(name)!=null){ return errors.get(name); }
        return "";
    }
    
    private Map<String,String[]> getCredencials(Model model){
        Map<String,String[]> credencials = new HashMap<String,String[]>();
        credencials.put("name", new String[]{model.getClient().getNombre()});
        credencials.put("telephone", new String[]{Integer.toString(model.getClient().getTelefono())});
        credencials.put("user-name", new String[]{model.getClient().getUsuario().getPassword()});
        credencials.put("password", new String[]{model.getClient().getUsuario().getPassword()});
        return credencials;
    }
%>
