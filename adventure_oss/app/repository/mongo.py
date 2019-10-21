import os
from pymongo import MongoClient

COLLECTION_NAME = 'adventures'

class MongoRepository(object):
    def __init__(self):
        mongo_url = os.environ.get('MONGO_URL')
        self.db = MongoClient(mongo_url).adventures

    def find_all(self, selector):
        return self.db.adventures.find(selector)

    def find(self, selector):
        return self.db.adventures.find_one(selector)

    def create(self, adventure):
        return self.db.adventures.insert_one(adventure)

    def update(self, selector, adventure):
        return self.db.adventures.replace_one(selector, adventure).modified_count
        
    def delete(self, selector):
        return self.db.adventures.delete_one(selector).deleted_count