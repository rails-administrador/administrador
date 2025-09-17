// Pagination size functionality - converted from CoffeeScript
class PaginationSize {
  constructor() {
    this.attachEventListeners();
  }
  
  attachEventListeners() {
    const paginationSizeSelects = document.querySelectorAll('[data-select-pagination-size]');
    
    paginationSizeSelects.forEach((element) => {
      // Set current value from URL parameters - with a small delay to ensure DOM is ready
      setTimeout(() => {
        this.setCurrentValue(element);
      }, 10);
      
      // Remove existing listeners to prevent duplicates
      element.removeEventListener('change', this.handlePaginationChange.bind(this));
      element.addEventListener('change', this.handlePaginationChange.bind(this));
    });
  }
  
  setCurrentValue(element) {
    const queryParameters = this.parseUrlParameters();
    const urlPerPage = queryParameters['per_page'];
    const dataPerPage = element.dataset.currentPerPage;
    
    // Use URL parameter if available, otherwise use data attribute
    const targetPerPage = urlPerPage || dataPerPage;
    
    if (targetPerPage) {
      const optionExists = Array.from(element.options).some(option => option.value === targetPerPage);
      
      if (optionExists) {
        element.value = targetPerPage;
      }
    }
  }
  
  parseUrlParameters() {
    const queryParameters = {};
    const queryString = location.search.substring(1);
    const regex = /([^&=]+)=([^&]*)/g;
    let match;

    while ((match = regex.exec(queryString)) !== null) {
      queryParameters[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
    }
    
    return queryParameters;
  }
  
  handlePaginationChange(e) {
    const queryParameters = this.parseUrlParameters();
    const perPage = e.target.value;
    queryParameters['per_page'] = perPage;
    
    const params = new URLSearchParams(queryParameters);
    location.search = params.toString();
  }
  
  static initialize() {
    return new PaginationSize();
  }
}

export default PaginationSize;
