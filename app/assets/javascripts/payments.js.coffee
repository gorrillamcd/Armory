jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()

subscription =
  setupForm: ->
    $('#new_payment').submit ->
      $('input[type=submit]').attr('disabled', true)
      subscription.processCard()
      false

  processCard: ->
    card =
      number: $('#credit_card_number').val()
      cvc: $('#cvv').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, subscription.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      alert(response.id)
      # $('#subscription_stripe_card_token').val(response.id)
      # $('#new_subscription')[0].submit()
    else
      alert(response.error.message)
      # $('#stripe_error').text(response.error.message)
      # $('input[type=submit]').attr('disabled', false)