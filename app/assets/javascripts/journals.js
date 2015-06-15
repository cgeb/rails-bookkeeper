$(document).ready(function() {
  $("#add-new-debit").unbind('click').bind('click', function(){
    $("#debit-group").append($("#new-debit-form").html());
  });
  $("#debit-group").on('click', "#remove-new-debit", function(){
    $(this).closest('.control-group').remove();
  });
  $("#add-new-credit").unbind('click').bind('click', function(){
    $("#credit-group").append($("#new-credit-form").html());
  });
  $("#credit-group").on('click', "#remove-new-credit", function(){
    $(this).closest('.control-group').remove();
  });
});