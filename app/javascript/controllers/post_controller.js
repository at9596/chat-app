import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["input","results"]; // Declares 'results' as a target for dynamic updates

   // Use a timeout to prevent the function from firing on every keystroke
   searchTimeout = null;
  connect() {
    console.log("Post Controller connected");
    // console.log(this.inputTarget);

  }
  search() {
    clearTimeout(this.searchTimeout); // Clear the existing timeout
    
    this.searchTimeout = setTimeout(() => {
      this.element.submit();
      this.fetchResults();
    } , 300); // Set a new timeout
  }
  async fetchResults() {
    const query = this.inputTarget.value; // Use the target directly
    console.log(query);
    const url = `/posts?search=${encodeURIComponent(query)}`;
    try {
      const response = await fetch(url, { headers: { 'Accept': 'text/html' } });
     
      const html = await response.text();
     // Parse the HTML string into a DOM element
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');

      // Extract the content within the <div> with id "search-results"
      const searchResultsDiv = doc.getElementById('posts');
      const searchResultsContent = searchResultsDiv.innerHTML;
      this.resultsTarget.innerHTML = searchResultsContent;
    } catch (error) {
      console.error("Error fetching search results:", error);
    }
  }
  resetSearch() {
    // Clear the search input and results
    this.inputTarget.value = "";
    this.resultsTarget.innerHTML = "";
  }
}
