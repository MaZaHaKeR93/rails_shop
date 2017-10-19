When(/^мы хотим зарегестрировать на сайте человека "([^"]*)" с почтой "([^"]*)" и паролем "([^"]*)"$/) do |name, email, password|
	visit('/users/sign_up')
	within('#new_user') do
	 	fill_in('Name', with: name)
		fill_in('Email', with: email)
		fill_in('Password', with: password)
		fill_in('Password confirmation', with: password)
		click_button('Sign up')
	end
end
When(/^в навигационной панели сайта можно увидеть, что мы залогинены как "([^"]*)"$/) do |name|
	visit(root_path)
	page.has_xpath?("//p[@class='navbar-text'][contains(text(), 'Logged in as #{name}')]")
end
