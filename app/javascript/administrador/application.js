// Import individual components
import "./pagination_size.js";

class AdministradorApplication {
  constructor() {
    this.initializeComponents();
  }
  
  initializeComponents() {
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
