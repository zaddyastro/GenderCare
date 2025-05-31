
document.getElementById("supportForm").addEventListener("submit", function(e) {
  e.preventDefault();
  document.getElementById("form-response").innerText = "Thank you! We'll contact you soon.";
  this.reset();
});
