json.users @users do |user|
    json.id                 user.id
    json.name				user.name
	json.username           user.username
    json.affiliation        user.affiliation
    if user_signed_in? 
        if user.connections.contains(user)
            json.addedToContacts  true
        else
            json.addedToContacts  false
        end
    else
        json.addedToContacts  false
    end
end
