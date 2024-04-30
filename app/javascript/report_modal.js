document.addEventListener('DOMContentLoaded', function () {
  var reportModal = document.getElementById('newReportFormModal');
  var form = reportModal.querySelector('form');
  
  // Check if event listeners are already attached
  if (!form.hasEventListener) {
      form.hasEventListener = true; // Mark that event listeners are attached
      
      reportModal.addEventListener('show.bs.modal', function (event) {
          var button = event.relatedTarget; // Button that triggered the modal
          var commentId = button.getAttribute('data-comment-id'); // Extract info from data-* attributes
          var postId =    button.getAttribute('data-post-id');
          var formAction = `/posts/${postId}/comments/${commentId}/reports`; 
          form.action = formAction; 
      });

      form.addEventListener('submit', function(event){
          event.preventDefault(); // Prevent the default form submission
          fetch(form.action, {
              method: 'POST',
              body: new FormData(form),
              headers:{
                  'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
              }
          })
          .then(response => {
              if(response.ok){
                  return response.json();
              } else {
                  throw new Error('Something went wrong on the server.');
              }
          })
          .then(data => {
              console.log('Success:', data);
              // Clear form fields here
              form.reset();
              // Close the modal
              var modalInstance = bootstrap.Modal.getInstance(reportModal);
              modalInstance.hide();
          })
          .catch(error => {
              console.error('Error:', error);
          });
      });
  }
});
