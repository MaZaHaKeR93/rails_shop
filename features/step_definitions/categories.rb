When(/^залогинен пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
	visit('/users/sign_in')
	within('#new_user') do 
		fill_in('Email', with: email)
		fill_in('Password', with: password)
		click_button('Log in')
	end
end

When(/^он создает категорию "([^"]*)"$/) do |title|
	visit('/admin/categories/new')
	within('#new_category') do
		fill_in('Name', with: title)
		click_button('Create Category')
	end
end

When(/^категорию "([^"]*)" видно в списке категорий$/) do |name|
	visit('/admin/categories')
	page.has_xpath?("//table//td[contains(text(), '#{name}')]")
end
