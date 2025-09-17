// Import individual components
import PaginationSize from "administrador/pagination_size";

class AdministradorApplication {
  constructor() {
    this.initializeComponents();
  }
  
  initializeComponents() {
    this.paginationSize = PaginationSize.initialize();
    console.log("Administrador application initialized with modern JavaScript");
  }
  
  static initialize() {
    return new AdministradorApplication();
  }
}

// Auto-initialize on DOM load
document.addEventListener('DOMContentLoaded', function() {
  AdministradorApplication.initialize();
});

// Also initialize on Turbo load for Rails apps
document.addEventListener('turbo:load', function() {
  AdministradorApplication.initialize();
});

export default AdministradorApplication;
