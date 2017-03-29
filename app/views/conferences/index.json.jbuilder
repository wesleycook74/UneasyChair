json.conferences @conferences do |conference|
    json.id                 conference.id
    json.name				conference.name
	json.acronym            conference.acronym
    json.tracks        		conference.tracks
end
