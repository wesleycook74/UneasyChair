json.users @users do |user|
    json.id                 user.id
    json.name				user.name
	json.username           user.username
    json.affiliation        user.affiliation
	json.profpic			user.profpic
    if user_signed_in? 
        if current_user.connections.any? {|u| u.contact_id == user.id}
            json.addedToContacts  true
			json.contact_id 	current_user.connections.where(contact_id: user.id).first.id
        else
            json.addedToContacts  false
        end
    else
        json.addedToContacts  false
    end
end
