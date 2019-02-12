
class Quest {
    constructor(name, description, id) {
        this.name = name;
        this.description = description;
        this.id = id;
    };
}

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

function getQuest(questId, questCallback) {

}