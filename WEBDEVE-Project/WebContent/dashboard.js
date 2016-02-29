// To do
// research making classes in javascript or oop or javascriptmvc
// Make account class in javascript
$(document).ready(function() {

  // Global Functions
  // try put classes here
  function testFunction() {
    alert("testFunction is called");
  }

  $(".navbaritem").click(function() {
    // Erase first contents in #content

    // Remove all active in all class
    $(".navbaritem").removeClass("active");

    // Make active the clicked linked
    $(this).addClass("active");

    // Erase first contents in #content
    $("#content").empty();
    // add content with the clicked linked

    var navbar_name = $(this).attr("name");

    switch (navbar_name) {
      case "home":

        // gui of homepage
        var h1 = $("<h1/>");
        var p = $("<p/>");

        h1.html("Hello World");
        p.html("Welcome to Peso's Online Bank.");

        $("#content").append(h1);
        $("#content").append(p);

        break;
      case "manage-accounts":
        
        // gui of manage accounts
        var h1 = $("<h1/>");

        h1.html("Manage Accounts")
        

        break;

    }
  });


});