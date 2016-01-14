require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/email_address')
require('./lib/mailing_address')
require('./lib/phone_number')
require('pry')

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
  @phone_numbers = PhoneNumber.find_by_contact_id(@contact_id)
  @phone_numbers.each do |phone_number|
    number_id = phone_number.id().to_s
    area_id = phone_number.id().to_s << "_area"
    if params.fetch(number_id) != ""
      phone_number.phone_number = params.fetch(number_id)
    end

    if params.fetch(area_id) != ""
      phone_number.area_code = params.fetch(area_id)
    end
  end

  new_number = params[:new_number]
  if new_number != ""
    new_number = PhoneNumber.new({:area_code    => params[:new_number_area],
                                  :phone_number => new_number,
                                  :type         => params[:new_number_type],
                                  :contact_id   => @contact_id})
    new_number.save()
  end

  redirect "/contacts/#{@contact_id}"
end

get('/contacts/:id/update') do
  @contact_id = params[:id].to_i()
  @contact = Contact.find(@contact_id)
  @phone_numbers = PhoneNumber.find_by_contact_id(@contact_id)
  erb(:contact_update_form)
end

get('/contacts/:contact_id/:number_id/delete') do
  phone_number = PhoneNumber.find(params[:number_id].to_i)
  phone_number.delete()
  redirect("/contacts/#{params[:contact_id]}/update")
end
