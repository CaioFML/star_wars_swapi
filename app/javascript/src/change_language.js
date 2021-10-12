$(document).on("turbolinks:load", () => {
  function changeLanguage(language) {
    let id = $("#person_id").val()

    $.ajax({
      url: `/change_introduction_language/${id}?language=${language}`,
      method: "POST",
      success: function(data) {
        console.log('success')
      },
      error: function() {
        console.log('failure')
      }
    });
  };

  $("#change_language_english").on("click", () => changeLanguage("english"));
  $("#change_language_wookiee").on("click", () => changeLanguage("wookiee"));
});