class Event {
    constructor(name, description, combat, social, search, id, quest_id) {
        this.name = name;
        this.description = description;
        this.combat = combat;
        this.social = social;
        this.search = search;
        this.id = id;
        this.quest_id = quest_id
    };
}

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

$(document).ready(function() {
    let questId = $('#event-form').data("quest-id");
    $("#added-event-submit").click(function(e) {
        e.preventDefault();
        let url = `/quests/${questId}/events`;
        let form = $(this);
        let formSerialized = form.serialize();
        $.ajax({
            url: url,
            method: 'post',
            data: formSerialized,
            dataType: 'json'
        }).done(function(response){
            console.log('response: ', response);

            event = new Event(response.name, response.description, response.combat, response.social, response.search, response.id, response.quest_id);

            $('#owned-events').html(event);
        });    
    });
})

// used by getEvents()
Event.prototype.showEventSummary = function() {
    return '<h5><a href= "quests/'+this.quest_id+'/events/'+this.id+'">' +this.name+'</a></h5>';
    // html addendum
}