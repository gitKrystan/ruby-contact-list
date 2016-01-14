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
  @contact = Contact.find(params[:id].to_i())
  erb(:contact)
end
