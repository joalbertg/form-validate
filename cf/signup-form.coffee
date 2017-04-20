$ ->
	$('form p span').hide()

	$username_input = $('#username')
	$password_input = $('#password')
	$confirm_password_input = $('#confirm_password')
	$submit = $('#submit')

	is_username_valid = ->
		$username_input.val().length >= 3

	is_password_valid = ->
		$password_input.val().length >= 6

	are_passwords_maching = ->
		$password_input.val() is $confirm_password_input.val()

	username_event = ->
		if is_username_valid()
			$username_input.next().hide()
		else
			$username_input.next().show()

	password_event = ->
		if is_password_valid()
			$password_input.next().hide()
		else
			$password_input.next().show()

	confirm_password_event = ->
		if are_passwords_maching()
			$confirm_password_input.next().hide()
		else
			$confirm_password_input.next().show()

	are_all_vaidations_passing = ->
		is_username_valid() and is_password_valid() and are_passwords_maching()

	form_state_event = ->
		$submit.attr('disabled', not are_all_vaidations_passing())

	$username_input.focus(username_event).keyup(username_event).keyup(password_event).keyup(form_state_event)
	$password_input.focus(password_event).keyup(password_event).keyup(confirm_password_event).keyup(form_state_event)
	$confirm_password_input.focus(confirm_password_event).keyup(confirm_password_event).keyup(form_state_event)

	form_state_event()