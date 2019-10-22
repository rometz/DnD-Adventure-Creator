from ..repository import Repository
from ..repository.mongo import MongoRepository
from .schema import AdventureSchema

class Service(object):
    def __init__(self, user_id, adv_client=Repository(adapter=MongoRepository)):
        self.adv_client = adv_client
        self.user_id = user_id

        if not user_id:
            raise Exception("user id not provided")

    def find_all_adventures(self):
        adventures = self.adv_client.find_all({'user_id': self.user_id})
        return [self.dump(adventure) for adventure in adventures]

    def find_adventure(self, adventure_id):
        adventure = self.adv_client.find({'user_id': self.user_id, 'adventure_id': adventure_id})

    def create_adventure_for(self, advRepo):
        self.adv_client.create(self.prepare_adventure(advRepo))
        return self.dump(advRepo.data)

    def update_adventure_with(self, adventure_id, advRepo):
        records_affected = self.adv_client.update({'user_id': self.user_id, 'adventure_id': adventure_id}, self.prepare_adventure(advRepo))
        return records_affected > 0

    def delete_adventure_with(self, adventure_id):
        records_affected = self.adv_client.delete({'user_id': self.user_id, 'adventure_id': adventure_id})
        return records_affected > 0

    def dump(self, data):
        return AdventureSchema(exclude=['_id']).dump(data).data

    def prepare_adventure(self, advRepo):
        data = advRepo.data
        data['user_id'] = self.user_id
        return data