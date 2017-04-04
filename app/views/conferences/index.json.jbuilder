json.conferences @conferences do |conference|
    json.id                 conference.id
    json.name				conference.name
	json.acronym            conference.acronym
    json.description        conference.description
    json.tracks        		conference.tracks
end
