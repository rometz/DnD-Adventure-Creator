from ..repository import Repository
from ..repository.mongo import MongoRepository
from .schema import AdventureSchema

class Service(object):
    def __init__(self, user_id, repo_client=Repository(adapter=MongoRepository)):
        self.repo_client = repo_client
        self.user_id = user_id

        if not user_id:
            raise Exception("user id not provided")

    def find_all_adventures(self):
        adventures = self.repo_client.find_all({'user_id': self.user_id})
        return [self.dump(adventure) for adventure in adventures]

    def find_adventure(self, repo_id):
        adventure = self.repo_client.find({'user_id': self.user_id})

    def create_adventure_for(self, advRepo):
        self.repo_client.create(self.prepare_adventure(advRepo))
        return self.dump(advRepo.data)