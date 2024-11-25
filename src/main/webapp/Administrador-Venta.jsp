<%@page import="model.Presentacion"%>
<%@page import="model.Presentacion"%>
<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}//css/venta-Admin.css">
    <link rel="icon" href="${pageContext.request.contextPath}//img/logo.ico" type="image/x-icon">
    <title>BOTICA LUHFARMA</title>
</head>
<body>
    <aside class="sidebar fixed left-0 top-0 h-full w-64 bg-white shadow-lg" id="sidebar">
        <div class="sidebar-header flex items-center justify-between p-4">
            <img src="${pageContext.request.contextPath}/img/logo.ico" alt="Logo" class="w-12 h-12">
            <button class="close-btn" onclick="toggleSidebar()"><i class="fas fa-times"></i></button>
        </div>
        <nav class="nav-links flex flex-col space-y-2 p-4">
            <a href="${pageContext.request.contextPath}/CantidadClientes" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-tachometer-alt w-5"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/Administrador-Producto.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-pills mr-3"></i>Productos</a>
            <a href="${pageContext.request.contextPath}/ListarUsuarios" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-users mr-3"></i>Usuarios</a>
            <a href="${pageContext.request.contextPath}/Administrador-Reporte.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-chart-line mr-3"></i>Reportes</a>
            <a href="${pageContext.request.contextPath}/Administrador-Inventario.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Inventario</a>
            <a href="${pageContext.request.contextPath}/Administrador-Venta.jsp" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-shopping-cart mr-3"></i>Ventas</a>
            <a href="${pageContext.request.contextPath}/ListarProveedor" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-truck mr-3"></i>Proveedores</a>
            <a href="${pageContext.request.contextPath}/Compra" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-credit-card mr-3"></i>Compra</a>
            <a href="${pageContext.request.contextPath}/ListarAlmacen" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-warehouse mr-3"></i>Almacen</a>
            <a href="${pageContext.request.contextPath}/Administrador-Categorias" class="nav-link flex items-center text-gray-700 hover:text-blue-600"><i class="fas fa-cogs mr-3"></i>Categoria</a>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario");if (usuario != null) {String nombreUsuario = usuario.getNombre();String correoUsuario = usuario.getCorreo();%>
            <div class="mt-auto pt-4 border-t">
                <div class="flex items-center">
                    <img src="${pageContext.request.contextPath}/img/pr.webp" alt="Usuario" class="w-8 h-8 rounded-full">
                        <div class="ml-3">
                            <p class="text-sm font-medium text-gray-700"><%= nombreUsuario %></p>
                            <p class="text-xs text-gray-500"><%= correoUsuario %></p>
                        </div>
                </div>
            </div>
            <% } else {response.sendRedirect("Usuario-Principal.jsp");}%>
        </nav>
    </aside>

    <header class="header flex items-center justify-between p-4 bg-white shadow-md">
        <button class="menu-btn text-gray-700 hover:text-gray-900" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        <a href="${pageContext.request.contextPath}/index.jsp" class="logout-btn flex items-center text-gray-700 hover:text-red-600"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar Sesi�n</a>
    </header>
    <br><br><br><br>
    <div class="container mx-auto p-4">
        <div class="card bg-white shadow-md rounded-lg p-4 mb-4">
            <h2 class="text-lg font-bold">Nueva Venta</h2>
            <div class="form-group">
                <label for="codigo-venta" class="block text-sm font-medium text-gray-700">C�digo de Venta</label>
                <input type="text" id="codigo-venta" readonly class="mt-1 block w-full p-2 border border-gray-300 rounded">
            </div>
            <div class="form-group">
                <label for="articulo" class="block text-sm font-medium text-gray-700">Art�culo</label>
                <select id="articulo" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                    <option value="">Seleccione un producto</option>
                    <% List<Producto> aPr = (List<Producto>) request.getAttribute("aPrd"); if (aPr != null && !aPr.isEmpty()) {for (Producto pr : aPr) {%>
                    <option value="<%= pr.getIdProducto() %>"><%= pr.getNombre() %></option>
                    <% }} else { %><option disabled>No hay productos registradas disponibles</option><% } %>
                </select>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div class="form-group">
                    <label for="unidad" class="block text-sm font-medium text-gray-700">Presentaci�n</label>
                    <select id="unidad" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">Seleccione un producto</option>
                        <% List<Presentacion> pres = (List<Presentacion>) request.getAttribute("aPres");if (pres != null && !pres.isEmpty()) {for (Presentacion pr : pres) { %>
                        <option value="<%= pr.getIdPresentacion() %>"><%= pr.getNombre() %></option>
                        <% }} else { %><option disabled>No hay presentaciones registradas disponibles</option><% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cantidad" class="block text-sm font-medium text-gray-700">Cantidad</label>
                    <input type="text" id="txtCantidad" min="1" value="1" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                </div>
            </div>
            <div class="form-group">
                <label for="precio" class="block text-sm font-medium text-gray-700">Precio Unitario</label>
                <input type="text" id="txtPrecio" readonly class="mt-1 block w-full p-2 border border-gray-300 rounded">
            </div>
            <button id="agregar" class="mt-4 bg-blue-600 text-white p-2 rounded"><i class="fas fa-plus"></i>Agregar al Carrito</button>
            <div class="button-group mt-4 flex gap-2">
                <button id="nueva-venta" class="flex-1 bg-green-600 text-white p-2 rounded"><i class="fas fa-file"></i>Nueva Venta</button>
                <button id="salir" class="flex-1 bg-red-600 text-white p-2 rounded"><i class="fas fa-sign-out-alt"></i>Salir</button>
            </div>
        </div>
        <div class="card bg-white shadow-md rounded-lg p-4">
            <h2 class="text-lg font-bold">Detalle de Venta</h2>
            <div class="productos-lista" id="productos-lista"></div>
            
            <div class="total-section flex justify-between mt-4">
                <span class="font-medium">Total</span>
                <span id="total" class="font-bold">S/ 0.00</span>
            </div>
            <button id="confirmar-venta" class="mt-4 w-full bg-blue-600 text-white p-2 rounded"><i class="fas fa-check"></i>Confirmar Venta</button>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/venta-Admin.js"></script>
</body>
</html>
