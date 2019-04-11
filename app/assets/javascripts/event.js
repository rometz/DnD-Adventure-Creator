class Event {
    constructor(name, description, combat, social, search) {
        this.name = name;
        this.description = description;
        this.combat = combat;
        this.social = social;
        this.search = search;
        this.id = id;
        this.quest_id = quest_id
    };
}
/*
$.ajax({
    url: `/api/quest/${quest_id}/events`,
    method: 'get',
    datatype: 'json'
    */
// getEvents() renders for the Quests has_many Events
function getEvents(quest_id, eventsCallback) {

    let url = `/api/quest/${quest_id}/events`;
    $.getJSON(
        url
        ).done(function(response){
        console.log('response: ', response);

        let events = response.map(ele => {
            return new Event(ele.name, ele.description, ele.combat, ele.social, ele.search, ele.id, ele.quest_id);
        });
        

        console.log("Yar, her' be events: ", events)
        eventsCallback(events);
    });
}

// used by getEvents()
Event.prototype.showEventSummary = function() {
    return '<h5><a href= "quests/'+this.quest_id+'/events">' +this.name+'</a></h3>';
    // html addendum
}