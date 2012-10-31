$(document).ready ->
  if typeof Stripe == 'function'
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
    payment.setupForm()

payment =
  setupForm: ->
    $('#new_payment').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#credit_card_number').length
        payment.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#credit_card_number').val()
      cvc: $('#cvc').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#payment_stripe_card_token').val(response.id)
      $('#new_payment')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)