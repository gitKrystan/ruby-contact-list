require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/email_address')
require('./lib/mailing_address')
require('./lib/phone_number')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/') do
  new_contact = Contact.new({:first => params[:first],
                             :last  => params[:last],
                             :title  => params[:title],
                             :company  => params[:company]})
  new_contact.save()
  redirect('/')
end

get('/contacts/new') do
  erb(:contact_form)
end

get('/contacts/:id') do
  @contact_id = params[:id].to_i()
  @contact = Contact.find(@contact_id)
  @phone_numbers = PhoneNumber.find_by_contact_id(@contact_id)
  erb(:contact)
end

post('/contacts/:id') do
  @contact_id = params[:id].to_i()
  @contact = Contact.find(@contact_id)
  home_number = params[:home]
  work_number = params[:work]
  cell_number = params[:cell]

  if home_number.length() > 0
    home = PhoneNumber.new({:area_code    => params[:home_area],
                            :phone_number => home_number,
                            :type         => "home",
                            :contact_id   => params[:id].to_i()})
    home.save()
  end
  
  redirect "/contacts/#{@contact_id}"
end

get('/contacts/:id/update') do
  @contact = Contact.find(params[:id].to_i())
  erb(:contact_update_form)
end
