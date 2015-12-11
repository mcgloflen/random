var handler = StripeCheckout.configure({
key: 'pk_test_zPwH8mfvYp2jFa9LtjNjjM9b',
image: '#',
token: function(token, args) {
    document.getElementById("stripeToken").value = token.id;                              
    document.getElementById("stripeEmail").value = token.email;
    document.getElementById("chargeForm").submit();
  }
});

document.getElementById('subscribeButton').addEventListener('click', function(e) {
// Open Checkout with further options
handler.open({
  name: 'Texter',
  description: 'Subscription ($1.00)',
  amount: 100,
});
e.preventDefault();
});

$(document).on("click", "#subscribeButton", function () {
    if ($("#phonenumber").val().length >= 9 && ("#phonenumber").val().length <= 10) {
        handler.open({
          name: 'Texter',
          description: 'Subscription ($1.00)',
          amount: 100,
        });
    } else {
        alert("Invalid phone number!");
    }
    event.preventDefault();
});