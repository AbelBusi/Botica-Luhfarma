document.addEventListener("DOMContentLoaded", function() {
    // Navegación en tarjetas de la vista admin
    const cards = document.querySelectorAll(".card");
    cards.forEach((card, index) => {
        card.addEventListener("click", function() {
            switch (index) {
                case 0:
                    window.location.href = "Administrador-Producto.jsp";
                    break;
                case 1:
                    window.location.href = "/ListarUsuarios";
                    break;
                case 2:
                    window.location.href = "Administrador-Reporte.jsp";
                    break;
                case 3:
                    window.location.href = "Administrador-Inventario.jsp";
                    break;
                case 4:
                    window.location.href = "Administrador-Venta.jsp";
                    break;
                case 5:
                    window.location.href = "/ListarProveedor";
                    break;
                default:
                    console.error("Página no encontrada");
            }
        });
    });
});

// Función para abrir/cerrar sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

// Cerrar sidebar en dispositivos móviles al hacer clic fuera
document.addEventListener('click', function(event) {
    const sidebar = document.getElementById('sidebar');
    const menuBtn = document.querySelector('.menu-btn');
    
    if (window.innerWidth <= 1024 && 
        !sidebar.contains(event.target) && 
        !menuBtn.contains(event.target) && 
        !sidebar.classList.contains('closed')) {
        toggleSidebar();
    }
});

// Ajustar sidebar al redimensionar la ventana
window.addEventListener('resize', function() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    if (window.innerWidth <= 1024) {
        sidebar.classList.add('closed');
        body.classList.add('sidebar-closed');
    } else {
        sidebar.classList.remove('closed');
        body.classList.remove('sidebar-closed');
    }
});
