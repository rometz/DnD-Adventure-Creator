
class Quest {
    constructor(name, description, id) {
        this.name = name;
        this.description = description;
        this.id = id;
    };
}

// getQuests renders for the index page 
function getQuests(questsCallback) {
    $.ajax({
        url: '/api/quests',
        method: 'get',
        dataType: 'json'
    }).done(function(response){
        console.log('response: ', response);

        // This creates a new object for Quest
        let quests = response.map(ele => {
            return new Quest(ele.name, ele.description, ele.id);
        });

        console.log("Yarr, her' be quests:", quests);
        questsCallback(quests);
    });
}

// getQuest will execute when information regarding a single quest is desired
function getQuest(questId, questCallback) {
    $.ajax({
        url: '/api/quests',
        method: 'get',
        dataType: 'json'
    }).done(function(response){
        console.log('response: ', response);

        quest = new Quest(response.name, response.description, response.id);

        console.log("Here is the quest you were looking for:", quest);
        questCallback(quest);
    });
}

//////////// AJAX prototype functions ///////////////////

// For appending quests to the index page //
// Needed for getQuests request //
Quest.prototype.showQuestSummary = function() {
    return '<h4><a href= "/quests/'+this.id+'">'+this.name+'</a></h3>';
}