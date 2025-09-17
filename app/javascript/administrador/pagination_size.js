// Pagination size functionality - converted from CoffeeScript
document.addEventListener('DOMContentLoaded', function() {
  const paginationSizeSelects = document.querySelectorAll('[data-select-pagination-size]');
  
  paginationSizeSelects.forEach(function(element) {
    element.addEventListener('change', function(e) {
      const queryParameters = {};
      const queryString = location.search.substring(1);
      const regex = /([^&=]+)=([^&]*)/g;
      let match;

      while ((match = regex.exec(queryString)) !== null) {
        queryParameters[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
      }

      const perPage = element.value;
      queryParameters['per_page'] = perPage;
      
      // Use URLSearchParams for better browser compatibility
      const params = new URLSearchParams(queryParameters);
      location.search = params.toString();
    });
  });
});

// Also initialize on Turbo load for Rails apps
document.addEventListener('turbo:load', function() {
  const paginationSizeSelects = document.querySelectorAll('[data-select-pagination-size]');
  
  paginationSizeSelects.forEach(function(element) {
    // Remove existing listeners to prevent duplicates
    element.removeEventListener('change', handlePaginationChange);
    element.addEventListener('change', handlePaginationChange);
  });
});

function handlePaginationChange(e) {
  const queryParameters = {};
  const queryString = location.search.substring(1);
  const regex = /([^&=]+)=([^&]*)/g;
  let match;

  while ((match = regex.exec(queryString)) !== null) {
    queryParameters[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
  }

  const perPage = e.target.value;
  queryParameters['per_page'] = perPage;
  
  const params = new URLSearchParams(queryParameters);
  location.search = params.toString();
}

export default { handlePaginationChange };
